> "The simpler the food, the harder it is to prepare well" - Joël Robuchon.

**Chef**
Chef is a data scheduling and normalization service built on [Mix Elixir](https://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html). 
Just like a chef in a restaurant collects raw ingredients and converts them into recipes, Chef fetches data from multiple match providers, normalized it and persists it into the `Postgre database`.

**Design**

* Aggregation of Services Pattern
* Builder pattern


**Usage**

* mix run --no-halt  (to run main application)
* mix test (validate test suit it will start mock cowboy server)
* mock cowboy server endpoint configuration can be configured from config file ```config/test.exs```
* default postgres instance is used for the project can be configured from config file ```config/config.exs```
```
config :chef,
       Chef.Repo,
       database: "chef_repo",
       username: "postgres",
       password: "postgres",
       hostname: "localhost"
```
* data fetch interval can be modified using config file ```config/config.exs``` as
```
config :chef,
  # unit milliseconds
  data_fetch_interval: 30000
```
* mix ecto.create (to create the chef_repo database)
* mix ecto.migrate (to create match_data table to store the normalized data)


**Appendix**
* libraries
    * httpoison
    * poison
    * postgrex
    * ecto_sql
    * plug_cowboy


**Flow & Context**

![Chef Flow](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/2jf3t5bjdwidwjm5je4m.jpeg)

