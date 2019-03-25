defmodule Elixibop.Areas.AreaTest do
  use ExUnit.Case
  doctest Elixibop.Areas.Area

  test "%Elixibop.Areas.Area{}" do
    expected = ~w[alias_list id iso_3166_2_code_list life_span name relation_list score sort_name type]a
    actual = %Elixibop.Areas.Area{} |> Map.from_struct() |> Map.keys()

    assert actual == expected
  end

  test "%Elixibop.Alias{}" do
    expected = ~w[locale primary sort_name text type]a
    actual = %Elixibop.Alias{} |> Map.from_struct() |> Map.keys()

    assert actual == expected
  end
end
