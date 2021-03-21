defmodule ChefTest do
  use ExUnit.Case
  doctest Chef

  test "greets the world" do
    assert Chef.hello() == :world
  end
end
