defmodule Chef do
  @moduledoc """
  Chef module.
  """
  use Application

  def start(_type, args) do
    children =
      case args do
        [env: :test] ->
          [{Plug.Cowboy, scheme: :http, plug: Chef.MockServer, options: [port: 8081]}]

        [_] ->
          [Chef.Scheduler, Chef.Repo]
      end

    opts = [strategy: :one_for_one, name: Chef.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
