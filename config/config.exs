import Config

config :chef,
       Chef.Repo,
       database: "chef_repo",
       username: "postgres",
       password: "postgres",
       hostname: "localhost"

config :chef,
  # unit milliseconds
  data_fetch_interval: 2000,
  data_providers: [:MatchBeam, :Test2]

config :chef, ecto_repos: [Chef.Repo]
