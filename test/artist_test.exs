defmodule Elixibop.ArtistTest do
  use ExUnit.Case
  doctest Elixibop.Artist

  test "%Elixibop.Artist{}" do
    expected = ~w[
      area
      begin_area
      country
      disambiguation
      id
      life_span
      name
      score
      type
    ]a
    actual = %Elixibop.Artist{} |> Map.from_struct() |> Map.keys()

    assert actual == expected
  end
end
