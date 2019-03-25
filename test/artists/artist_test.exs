defmodule Elixibop.Artists.ArtistTest do
  use ExUnit.Case
  doctest Elixibop.Artists.Artist

  test "%Elixibop.Artists.Artist{}" do
    expected = ~w[
      area
      begin_area
      country
      disambiguation
      id
      name
      score
      tags
      type
    ]a
    actual = %Elixibop.Artists.Artist{} |> Map.from_struct() |> Map.keys()

    assert actual == expected
  end
end
