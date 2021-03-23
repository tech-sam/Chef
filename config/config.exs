import Config

config :chef,
       Chef.Repo,
       database: "chef_repo",
       username: "postgres",
       password: "postgres",
       hostname: "localhost"

config :chef,
  # unit milliseconds
  data_fetch_interval: 5000

config :chef, ecto_repos: [Chef.Repo]
