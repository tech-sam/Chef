# defprotocol Chef.DataProvider do
#   def start_data_fetch?()
#   def data_process(data)
# end

# defp prepare_code_store_backend() do
#   {:ok, backend} = :application.get_env(:beamie, :code_store_backend)
#   Beamie.Store.Generator.gen_module(backend)
# end

# ...

# defmodule Beamie.Store.Generator do
#   # create a module at runtime that will dispatch to the chosen backend
#   def gen_module(backend) do
#     Module.create(Beamie.Store, quote do
#       @backend unquote(backend)

#       def put(bucket, key, value) do
#         apply(@backend, :put, [bucket, key, value])
#       end

#       def get(bucket, key) do
#         apply(@backend, :get, [bucket, key])
#       end
#     end)
#   end
# end

# defmodule WorkerBehaviour do
#   @callback perform(job :: Job.t)
# end

# defmodule EmailWorker do
#   @behaviour WorkerBehaviour
#   def perform(job) do
#   # ...
#   end
# end

# defmodule ScreenshotWorker do
#   @behaviour WorkerBehaviour
#   def perform(job) do
#   # ...
#   end
# end

# defmodule Processor do
#   def process_job(worker_module, job) do
#     apply(worker_module, :perform, [job])
#   end
# end

defmodule Chef.DataProvider do
  alias Chef.HttpClient, as: HttpClient

  def start_data_fetch do
    IO.puts("start data fecting")
    # data = HttpClient.get("http://forzaassignment.forzafootball.com:8080/feed/matchbeam")
    # IO.puts data
    # {
    #   "created_at": 1616337058,
    #   "kickoff_at": "2021-04-19T14:00:00Z",
    #   "teams": "Sporting Gijon - Real Zaragoza"
    # }

    {:ok, created_at} = DateTime.from_unix(1_616_337_058)

    {:ok, kickoff_at, 0} = DateTime.from_iso8601("2021-04-19T14:00:00Z")

    match = %Chef.MatchData{
      home_team: "AFC Bournemouth",
      away_team: "Real Zaragoza",
      provider: "matchbeam",
      created_at: created_at,
      kickoff_at: kickoff_at
    }
     changeset = Chef.MatchData.changeset(match, %{})
    # {:ok, test} = Chef.Repo.insert(changeset)
    # IO.inspect(test)
   # IO.puts("finish data processing")

    case Chef.Repo.insert(changeset) do
      {:ok, match} ->
        # do something with person
        IO.inspect(match)
      {:error, yoyo} ->
        IO.inspect(yoyo.errors)
    end
    IO.puts("finish data processing")

    # path = :code.lib_dir(:elixir, :ebin)
    # mods = Protocol.extract_impls(:MatchDataProvider, [path])
    # IO.inspect(mods)
  end
end

defprotocol MatchDataProvider do
  def fetch_match_data(args)
  def process_match_data(args)
  def persist_match_data(args)
end
