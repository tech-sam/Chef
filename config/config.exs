import Config

config :chef,
       Chef.Repo,
       database: "chef_repo",
       username: "postgres",
       password: "postgres",
       hostname: "localhost"

config :chef,
  # unit milliseconds
  data_fetch_interval: 30000

config :chef, ecto_repos: [Chef.Repo]

config :logger,
  level: :debug,
  handle_otp_reports: true,
  handle_sasl_reports: true,
  utc_log: true,
  truncate: :infinity,
  backends: [:console],
  metadata: :all,
  compile_time_purge_matching: [
    [level_lower_than: :info]
  ]

config :chef,
       Chef.DataProvider,
       matchbeam: "http://forzaassignment.forzafootball.com:8080/feed/matchbeam",
       fastball: "http://forzaassignment.forzafootball.com:8080/feed/fastball"

import_config "#{Mix.env()}.exs"
