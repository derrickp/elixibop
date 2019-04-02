defmodule Elixibop.LifeSpans.LifeSpanTest do
  use ExUnit.Case
  doctest Elixibop.LifeSpans.LifeSpan

  test "%Elixibop.LifeSpans.LifeSpan{}" do
    expected = ~w[begin end ended]a
    actual = %Elixibop.LifeSpans.LifeSpan{} |> Map.from_struct() |> Map.keys()

    assert actual == expected
  end
end
