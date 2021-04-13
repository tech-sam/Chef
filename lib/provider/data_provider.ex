defmodule Chef.DataProvider do

  import Chef.ProviderArgsBuilder

  @providers Application.fetch_env!(:chef, :providers)

  def start_data_fetch(args) do
    @providers
    |> Enum.map(fn config ->
      args = provider_end_point(args, config.url)
      Task.async(fn -> config.provider.fetch_match_data(args) end)
    end)
    |> Enum.map(&Task.await/1)
  end

  @doc """
  Invoked the fetch match data process for a provider.
  """
  @callback fetch_match_data(args :: ProviderArgs.t()) :: term | {:error, String.t()}
end
