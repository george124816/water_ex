defmodule WaterEx.Server do
  use GenServer

  @time_in_ms 1000 * 60 * 15

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl true
  def init(stack) do
    worker()

    {:ok, stack}
  end

  def worker() do
    Process.send_after(self(), :loop, @time_in_ms)
    WaterEx.Notification.send_notification()
  end

  @impl true
  def handle_info(:loop, stack) do
    worker()
    {:noreply, stack}
  end
end
