# data = HttpClient.get("http://forzaassignment.forzafootball.com:8080/feed/matchbeam")
# IO.puts data
# {
#   "created_at": 1616337058,
#   "kickoff_at": "2021-04-19T14:00:00Z",
#   "teams": "Sporting Gijon - Real Zaragoza"
# }

#   {:ok, created_at} = DateTime.from_unix(1_616_337_058)

#   {:ok, kickoff_at, 0} = DateTime.from_iso8601("2021-04-19T14:00:00Z")

#   match = %Chef.MatchData{
#     home_team: "AFC Bournemouth",
#     away_team: "Real Zaragoza",
#     provider: "matchbeam",
#     created_at: created_at,
#     kickoff_at: kickoff_at
#   }
#    changeset = Chef.MatchData.changeset(match, %{})
#   # {:ok, test} = Chef.Repo.insert(changeset)
#   # IO.inspect(test)
#  # IO.puts("finish data processing")

#   case Chef.Repo.insert(changeset) do
#     {:ok, match} ->
#       # do something with person
#       IO.inspect(match)
#     {:error, yoyo} ->
#       IO.inspect(yoyo.errors)
#   end

defmodule Chef.DataProvider.MatchBeam do
  alias Chef.HttpClient, as: HttpClient
  import Chef.MatchDataBuilder

  @behaviour Chef.DataProvider

  @provider "MatchBeam"

  @impl true
  def fetch_match_data do
    IO.puts("MatchBeam get_match_data")

    data =
      build()
      |> teams("Oldham Athletic - UD Almeria")
      |> provider(@provider)
      |> created_at(1_616_428_037)
      |> kickoff_at("2021-04-20T15:00:00Z")


    changeset = Chef.MatchData.changeset(data, %{})

    case Chef.Repo.insert(changeset) do
      {:ok, match} ->
        IO.inspect(match)
      {:error, changeset} ->
        IO.inspect(changeset.errors)
    end

  end

  # defimpl MatchDataProvider, for: MatchBeam do
  #   def fetch_match_data(_) do
  #     IO.puts(" MatchBeam fetch_match_data")
  #     "testing"
  #   end

  #   def process_match_data(_) do
  #     IO.puts(" MatchBeam process_match_data")
  #   end

  #   def persist_match_data(_) do
  #     IO.puts(" MatchBeam persist_match_data")
  #   end
  # end
end
