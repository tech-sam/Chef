defmodule Chef.Scheduler do
  use GenServer
  alias Chef.DataProvider, as: DataProvider
  import Chef.ProviderArgsBuilder

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    schedule_data_fetch()
    {:ok, state}
  end

  def handle_info(:start_data_fetch, state) do
    DataProvider.start_data_fetch(provider_args())
    schedule_data_fetch()
    {:noreply, state}
  end

  defp schedule_data_fetch() do
    Process.send_after(self(), :start_data_fetch, interval())
  end

  defp interval() do
    Application.fetch_env!(:chef, :data_fetch_interval)
  end

  defp provider_args() do
    current_time_stamp = DateTime.to_unix(DateTime.utc_now())

    build()
    |> last_checked_at(current_time_stamp)
  end
end
