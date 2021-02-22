defmodule Router do
  use GenServer

  def start_link(path) do
    GenServer.start_link(__MODULE__, path, name: __MODULE__)
  end

  def init(path) do
    (:ok, path)
  end

  def handle_cast({:router, path}, state) do
    WorkerSupervisor.init_worker(path)
    GenServer.cast(Worker, {:worker, path})
    {:noreply, state}
  end

end
