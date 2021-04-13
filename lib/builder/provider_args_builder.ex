defmodule Chef.ProviderArgsBuilder do
  @moduledoc """
  Common arguments builder for data providers , can be ignored by a provider if not required.
  """
  def build, do: %Chef.ProviderArgs{}

  def last_checked_at(match_args, last_checked_at),
    do: Map.put(match_args, :last_checked_at, last_checked_at)

  def provider_end_point(match_args, end_point),
    do: Map.put(match_args, :end_point, end_point)
end
