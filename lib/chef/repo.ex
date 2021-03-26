defmodule Chef.Repo do
  use Ecto.Repo,
    otp_app: :chef,
    adapter: Ecto.Adapters.Postgres
end
