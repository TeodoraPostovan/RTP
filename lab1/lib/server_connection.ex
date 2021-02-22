defmodule Server_Connection do

  def start_link(url) do
    {:ok, _pid} = EventsourceEx.new(url, stream_to: self())
    get_path()
  end

  def get_path() do
    receive do
      path -> GenServer.cast (Router, {:router, path})
    end

    get_path()
  end

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: (__MODULE__, :start_link, [opts]),
      type: :worker,
      restart: :permanent,
    }
  end
end
