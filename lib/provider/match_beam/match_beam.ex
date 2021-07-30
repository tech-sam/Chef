defmodule Chef.DataProvider.MatchBeam do
  require Logger
  alias Chef.HttpClient
  import Chef.DataProvider.DataRepo
  import Chef.MatchDataBuilder

  @behaviour Chef.Provider

  @provider "MatchBeam"

  @impl Chef.Provider
  def fetch_match_data(args) do
    case HttpClient.get(args.url) do
      {:ok, response} ->
        matches = Map.fetch!(response, "matches")

         Enum.each(matches, fn match ->
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
    |> teams(data)
    |> provider(@provider)
    |> created_at(data)
    |> kickoff_at(data)
  end
end
