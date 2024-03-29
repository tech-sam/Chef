import Config

config :chef,
       Chef.Repo,
       database: "chef_repo",
       username: "postgres",
       password: "postgres",
       hostname: "localhost"

config :chef,
  # unit milliseconds
  data_fetch_interval: 1000

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
  providers: [
    %{
      provider: Chef.DataProvider.MatchBeam,
      params: %{url: "http://forzaassignment.forzafootball.com:8080/feed/matchbeam"}
    },
    %{
      provider: Chef.DataProvider.FastBall,
      params: %{
        url: "http://forzaassignment.forzafootball.com:8080/feed/fastball",
        last_checked_at: DateTime.to_unix(DateTime.utc_now())
      }
    }
  ]

import_config "#{Mix.env()}.exs"
