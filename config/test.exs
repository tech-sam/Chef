import Config

config :chef,
  providers: [
    %{
      provider: Chef.DataProvider.MatchBeam,
      url: "localhost:8081/feed/matchbeam"
    },
    %{
      provider: Chef.DataProvider.FastBall,
      url: "localhost:8081/feed/fastball"
    }
  ]
