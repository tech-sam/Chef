defmodule Chef.DataProvider do
  import Chef.Provider

  @providers Application.fetch_env!(:chef, :providers)

  def start_data_fetch() do
    @providers
    |> Enum.map(fn config ->
      Task.async(fn -> config.provider.fetch_match_data(config.params) end)
    end)
    |> Enum.map(&Task.await/1)
  end
end
