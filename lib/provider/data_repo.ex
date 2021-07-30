defmodule Chef.DataProvider.DataRepo do
  def persist_match_data(data) do


  #  changeset = Chef.MatchData.changeset(data, %{})

    data
    |> Chef.MatchData.changeset(%{})
    |> Chef.Repo.insert()

    # case Chef.Repo.insert(changeset) do
    #   {:ok, _match} ->
    #     {:ok, "data inserted successfull"}

    #   {:error, changeset} ->
    #     IO.inspect(changeset.errors)
    #     {:error, changeset.errors}
    # end
  end
end
