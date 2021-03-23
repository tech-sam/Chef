defmodule Chef.DataProvider do
  alias Chef.DataProvider.{
    MatchBeam,
    FastBall
  }

  def start_data_fetch do
    providers()
    |> Enum.map(fn provider -> Task.async(fn -> provider.fetch_match_data() end) end)
    |> Enum.map(&Task.await/1)
    |> Enum.each(&IO.inspect/1)
  end

  @doc """
  Invoked to fetch users repositories given their username account.
  """
  @callback fetch_match_data() :: {:ok}

  defp providers() do
    [MatchBeam, FastBall]
  end
end
