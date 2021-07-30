defmodule Chef.DataProvider.DataRepo do
  def persist_match_data(data) do
    data
    |> Chef.MatchData.changeset(%{})
    |> Chef.Repo.insert()
  end
end
