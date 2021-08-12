defmodule Worker do
  use GenServer

  def start_link(path) do
    GenServer.start_link(__MODULE__, path, name: __MODULE__)
  end

  def init(path) do
    {:ok, path}
  end

  def handle_cast({:worker, path}, state) do
    IO.inspect(%{"Tweet: " => path})
    {:noreply, state}
  end
end
