defmodule Elixibop.LifeSpanTest do
  use ExUnit.Case
  doctest Elixibop.LifeSpan

  test "%Elixibop.LifeSpan{}" do
    expected = ~w[begin end ended]a
    actual = %Elixibop.LifeSpan{} |> Map.from_struct() |> Map.keys()

    assert actual == expected
  end
end
