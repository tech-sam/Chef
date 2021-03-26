defmodule ChefTest do
  use ExUnit.Case, async: false
  alias Chef.HttpClient, as: HttpClient
  import Chef.MatchDataBuilder
  doctest Chef

  test "create match data repo for FastBall provider when success" do
    end_point = "localhost:8081/feed/fastball"
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

  test "create match data repo for MatchBall provider when success" do
    end_point = "localhost:8081/feed/matchbeam"
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

  defp build_fastball_match(data) do
    build()
    |> teams(data["home_team"], data["away_team"])
    |> provider("FastBall")
    |> created_at(data["created_at"])
    |> kickoff_at(data["kickoff_at"])
  end

  defp build_matchbeam_match(data) do
    build()
    |> teams(data["home_team"], data["away_team"])
    |> provider("FastBall")
    |> created_at(data["created_at"])
    |> kickoff_at(data["kickoff_at"])
  end
end
