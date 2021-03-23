defmodule Chef.DataProvider.DataRepo do

  def persist_match_data(data) do
    changeset = Chef.MatchData.changeset(data, %{})

    case Chef.Repo.insert(changeset) do
      {:ok, _match} ->
        IO.puts("successfully persisted")

      {:error, changeset} ->
        IO.inspect(changeset.errors)
    end
  end

end
