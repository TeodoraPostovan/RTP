defmodule App.Application do


  use Application


  def start(_type, _args) do

    children = [
      %{
        id: ServerConnection1,
        start(Server_Connection, :start_link, ["http://localhost:4000/tweets/1"])
      },
      %{
        id: ServerConnection2,
        start(Server_Connection, :start_link, ["http://localhost:4000/tweets/2"])
      },
      %{
        id: Router,
        start(Router, :start_link, [""])
      },
      %{
        id: Supervisor,
        start(WorkerSupervisor, :start_link, [""])
      },
      %{
        id: Worker,
        start(Worker, :start_link, [""])
      }


    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: App.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
