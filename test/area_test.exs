defmodule Elixibop.AreaTest do
  use ExUnit.Case
  doctest Elixibop.Area

  test "%Elixibop.Area{}" do
    expected = ~w[alias_list id iso_3166_2_code_list life_span name sort_name]a
    actual = %Elixibop.Area{} |> Map.from_struct() |> Map.keys()

    assert actual == expected
  end

  test "%Elixibop.IsoCodeList{}" do
    expected = ~w[iso_3166_2_code]a
    actual = %Elixibop.IsoCodeList{} |> Map.from_struct() |> Map.keys()

    assert actual == expected
  end

  test "%Elixibop.Alias{}" do
    expected = ~w[locale primary sort_name text type]a
    actual = %Elixibop.Alias{} |> Map.from_struct() |> Map.keys()

    assert actual == expected
  end
end
