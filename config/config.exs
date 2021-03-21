import Config

config :chef,
  data_fetch_interval: 2000, #unit milliseconds
  data_providers: [:MatchBeam, :Test2]
