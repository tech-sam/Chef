defmodule Chef.MatchData do
  use Ecto.Schema

  schema "match_data" do
    field :home_team, :string
    field :away_team, :string
    field :provider, :string
    field :kickoff_at, :utc_datetime
    field :created_at, :utc_datetime
  end
end
