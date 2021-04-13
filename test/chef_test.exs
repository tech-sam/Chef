defmodule ChefTest do
  use ExUnit.Case, async: false
  alias Chef.HttpClient, as: HttpClient
  import Chef.MatchDataBuilder
  @providers Application.fetch_env!(:chef, :providers)
  doctest Chef

  test "create match data repo for FastBall provider when success" do
    end_point =
      Enum.find(@providers, fn config -> config.provider == Chef.DataProvider.FastBall end).url

    {:ok, response} = HttpClient.get(end_point)
    match = response["matches"]

    match_repo =
      Enum.at(match, 0)
      |> build_fastball_match

    assert %Chef.MatchData{
             away_team: "Cagliari Calcio",
             home_team: "Huddersfield Town",
             created_at: ~U[2021-03-26 01:57:01Z],
             kickoff_at: ~U[2021-04-13 01:00:00Z],
             provider: "FastBall"
           } == match_repo
  end

  test "create match data repo for MatchBeam provider when success" do
    end_point =
      Enum.find(@providers, fn config -> config.provider == Chef.DataProvider.MatchBeam end).url

    {:ok, response} = HttpClient.get(end_point)
    match = response["matches"]

    match_repo =
      Enum.at(match, 0)
      |> build_matchbeam_match

    assert %Chef.MatchData{
             home_team: "Arsenal",
             away_team: "Chelsea FC",
             created_at: ~U[2021-03-26 01:57:01Z],
             kickoff_at: ~U[2021-04-13 01:00:00Z],
             provider: "MatchBeam"
           } == match_repo
  end

  defp build_fastball_match(data) do
    build()
    |> teams(data["home_team"], data["away_team"])
    |> provider("FastBall")
    |> created_at(data["created_at"])
    |> kickoff_at(data["kickoff_at"])
  end

  defp build_matchbeam_match(data) do
    build()
    |> teams(data["teams"])
    |> provider("MatchBeam")
    |> created_at(data["created_at"])
    |> kickoff_at(data["kickoff_at"])
  end
end
