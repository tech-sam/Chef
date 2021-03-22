defmodule Chef do
  use Application

  def start(_type, _args) do
    children = [Chef.Scheduler,Chef.Repo]
    Supervisor.start_link(children, strategy: :one_for_one)
  end

end
