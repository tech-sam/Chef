defmodule Chef.Repo.Migrations.MatchData do
  use Ecto.Migration

  def change do
    create table(:match_data) do
      add :home_team, :string
      add :away_team, :string
      add :provider, :string
      add :kickoff_at, :utc_datetime
      add :created_at, :utc_datetime
      timestamps(type: :utc_datetime)
    end
  end
end
