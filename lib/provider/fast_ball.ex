defmodule Chef.DataProvider.FastBall do
  alias Chef.HttpClient, as: HttpClient
  import Chef.DataProvider.DataRepo

  import Chef.MatchDataBuilder

  @behaviour Chef.DataProvider

  @provider "FastBall"

  @provider_end_point "http://forzaassignment.forzafootball.com:8080/feed/fastball"

  @impl true
  def fetch_match_data do
    response = HttpClient.get(@provider_end_point)
    matches = response["matches"]

    Enum.map(matches, fn match ->
      match
      |> build_match
      |> persist_match_data
    end)

    {:ok}
  end

  defp build_match(data) do
    build()
    |> teams(data["home_team"],data["away_team"])
    |> provider(@provider)
    |> created_at(data["created_at"])
    |> kickoff_at(data["kickoff_at"])
  end
end
