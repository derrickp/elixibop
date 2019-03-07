defmodule ElixibopTest do
  use ExUnit.Case
  doctest Elixibop

  test "greets the world" do
    assert Elixibop.hello() == :world
  end
end
