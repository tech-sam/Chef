defmodule Chef.ProviderArgsBuilder do
  @moduledoc """
  Common arguments builder for data providers , can be ignored by a provider if not required.
  """
  def build, do: %Chef.ProviderArgs{}

  def last_checked_at(match_args, last_checked_at),
    do: %{match_args | last_checked_at: last_checked_at}
end
