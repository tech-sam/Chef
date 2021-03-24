defmodule Chef.ProviderArgsBuilder do
  def build, do: %Chef.ProviderArgs{}

  def last_checked_at(match_args, last_checked_at),
    do: %{match_args | last_checked_at: last_checked_at}
end
