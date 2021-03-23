defmodule Chef.DataProvider.FastBall do

  alias Chef.HttpClient, as: HttpClient


  @behaviour Chef.DataProvider

  @impl true
  def fetch_match_data do
    IO.puts("FastBall get_match_data")
    {:ok}
  end

end
