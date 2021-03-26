defmodule Chef.DataProvider.MatchBeam do
  require Logger
  alias Chef.HttpClient, as: HttpClient
  import Chef.DataProvider.DataRepo
  import Chef.MatchDataBuilder

  @behaviour Chef.DataProvider

  @provider "MatchBeam"

  @provider_end_point "http://forzaassignment.forzafootball.com:8080/feed/matchbeam"

  @impl Chef.DataProvider
  def fetch_match_data(_args) do
    case HttpClient.get(@provider_end_point) do
      {:ok, response} ->
        matches = response["matches"]

        Enum.map(matches, fn match ->
          match
          |> build_match
          |> persist_match_data
        end)

      {:error, reason} ->
        Logger.error("error while fetching data for provider #{@provider} due to  #{reason}")
    end
  end

  defp build_match(data) do
    build()
    |> teams(data["teams"])
    |> provider(@provider)
    |> created_at(data["created_at"])
    |> kickoff_at(data["kickoff_at"])
  end
end
