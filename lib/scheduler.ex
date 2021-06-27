defmodule Chef.Scheduler do
  @moduledoc """
  Schedule the data fetching job for all match providers based on configured fetch interval.
  """

  use GenServer
  alias Chef.DataProvider, as: DataProvider

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    schedule_data_fetch()
    {:ok, state}
  end

  def handle_info(:start_data_fetch, state) do
    DataProvider.start_data_fetch()
    schedule_data_fetch()
    {:noreply, state}
  end

  defp schedule_data_fetch() do
    Process.send_after(self(), :start_data_fetch, interval())
  end

  defp interval() do
    Application.fetch_env!(:chef, :data_fetch_interval)
  end
end
