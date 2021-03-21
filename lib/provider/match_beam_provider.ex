defmodule Chef.DataProvider.MatchBeam do

  defimpl MatchDataProvider, for: Chef.DataProvider.MatchBeam do
    def fetch_match_data(_) do
      IO.puts(" MatchBeam fetch_match_data")
      "testing"
    end

    def process_match_data(_) do
      IO.puts(" MatchBeam process_match_data")
    end

    def persist_match_data(_) do
      IO.puts(" MatchBeam persist_match_data")
    end
  end


end
