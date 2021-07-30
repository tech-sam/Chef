defmodule Chef.MatchDataBuilder do
  @moduledoc """
  Match data builder for data providers , normalized the data in a unified format to persist.
  """
  def build, do: %Chef.MatchData{}

  def teams(matchdata, %{"home_team" => _,"away_team" => _} = data) do
    home_team =  Map.fetch!(data, "home_team")
    away_team =  Map.fetch!(data, "away_team")
    %{matchdata | home_team: home_team, away_team: away_team}
end

  def teams(matchdata, %{"teams" => _} = data) do
    teams = Map.fetch!(data, "teams")
    [home_team, away_team] = String.split(teams, ~r/\s-\s/)
    %{matchdata | home_team: String.trim(home_team), away_team: String.trim(away_team)}
  end

  def provider(matchdata, provider),
    do: %{matchdata | provider: provider}

  def created_at(matchdata, data) do
    created_at = Map.fetch!(data, "created_at")
    {:ok, created_at_utc} = DateTime.from_unix(created_at)
    %{matchdata | created_at: created_at_utc}
  end

  def kickoff_at(matchdata, data) do
    kickoff_at = Map.fetch!(data, "kickoff_at")
    {:ok, kickoff_at_utc, 0} = DateTime.from_iso8601(kickoff_at)
    %{matchdata | kickoff_at: kickoff_at_utc}
  end
end
