import Config

config :chef,
       Chef.DataProvider,
       matchbeam: "localhost:8081/feed/matchbeam",
       fastball: "localhost:8081/feed/fastball"
