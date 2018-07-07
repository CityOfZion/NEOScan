defmodule NeoscanNode.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  alias NeoscanNode.NodeChecker
  alias NeoscanNode.EtsProcess

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      worker(EtsProcess, []),
      worker(NodeChecker, [])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_all, name: NeoscanNode.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
