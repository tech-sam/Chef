defmodule Chef.MatchData do
  use Ecto.Schema
  @timestamps_opts [type: :utc_datetime]

  schema "match_data" do
    field(:home_team, :string)
    field(:away_team, :string)
    field(:provider, :string)
    field(:kickoff_at, :utc_datetime)
    field(:created_at, :utc_datetime)
    timestamps()
  end

  def changeset(match_data, params \\ %{}) do
    match_data
    |> Ecto.Changeset.cast(params, [:home_team, :away_team, :provider, :kickoff_at, :created_at])
    |> Ecto.Changeset.validate_required([
      :home_team,
      :away_team,
      :provider,
      :kickoff_at,
      :created_at
    ])
  end
end
