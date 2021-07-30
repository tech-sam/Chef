defmodule Chef.MatchData do
  use Ecto.Schema
  @timestamps_opts [type: :utc_datetime]

  # master table for home and away team with differnt properties
  schema "match_data" do
    field(:home_team, :string)
    field(:away_team, :string)
    field(:provider, :string)
    field(:kickoff_at, :utc_datetime)
    field(:created_at, :utc_datetime)
    timestamps()
  end

  def changeset(%__MODULE__{} = match_data, params \\ %{}) do
    required_fields = [
      :home_team,
      :away_team,
      :provider,
      :kickoff_at,
      :created_at
    ]

    match_data
    |> Ecto.Changeset.cast(params, required_fields)
    |> Ecto.Changeset.validate_required(required_fields)
  end
end
