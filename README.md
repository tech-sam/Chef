> "The simpler the food, the harder it is to prepare well" - Joël Robuchon.

**Chef**
Chef is a data scheduling and normalization service built on [Mix Elixir](https://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html). 
Just like a chef in a restaurant collects raw ingredients and converts them into recipes, Chef fetches data from multiple match providers, normalized it and persists it into the `Postgre database`.

**Design**

* Aggregation of Services Pattern
* Builder pattern

**Flow & Context**

![Chef flow](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/3vxpvvcthga5mhnzgtdr.jpeg)

**Appendix**
* libraries
    * httpoison
    * poison
    * postgrex
    * ecto_sql
    * plug_cowboy



