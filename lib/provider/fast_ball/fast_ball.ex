defmodule Chef.DataProvider.FastBall do
  require Logger
  alias Chef.HttpClient, as: HttpClient
  import Chef.DataProvider.DataRepo

  import Chef.MatchDataBuilder

  @behaviour Chef.Provider

  @provider "FastBall"

  @impl Chef.Provider
  def fetch_match_data(args) do
    end_point = get_provider_endpoint(args)

    case HttpClient.get(end_point) do
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
    |> teams(data["home_team"], data["away_team"])
    |> provider(@provider)
    |> created_at(data)
    |> kickoff_at(data)
  end

  defp get_provider_endpoint(args) do
    if Map.has_key?(args, :last_checked_at),
      do: "#{args.url}?last_checked_at=#{args.last_checked_at}",
      else: args.url
  end

  def test(url) do
    IO.inspect("fastball test url #{url}")
  end
end
