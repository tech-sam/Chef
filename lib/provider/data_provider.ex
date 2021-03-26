defmodule Chef.DataProvider do
  alias Chef.DataProvider.{
    MatchBeam,
    FastBall
  }

  def start_data_fetch(args) do
    providers()
    |> Enum.map(fn provider -> Task.async(fn -> provider.fetch_match_data(args) end) end)
    |> Enum.map(&Task.await/1)
    |> Enum.each(&IO.inspect/1)
  end

  defp providers() do
    [MatchBeam, FastBall]
  end

  @doc """
  Invoked the fetch match data process for a provider.
  """
  @callback fetch_match_data(args :: ProviderArgs.t()) :: term | {:error, String.t()}
end
