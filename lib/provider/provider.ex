defmodule Chef.Provider do
  @typedoc """
  Response returned by a match data provider an atom ok or error followed by a success/failure message.
  """
  @type provider_response :: term | {:ok, String.t()} | {:error, String.t()}

  @doc """
  Invoked the fetch match data process for a provider.
  """
  @callback fetch_match_data(args :: ProviderArgs.t()) :: provider_response
end
