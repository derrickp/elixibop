defmodule Elixibop.HeadersTest do
  use ExUnit.Case
  doctest Elixibop.Headers

  test "returns a user_agent" do
    assert Elixibop.Headers.user_agent() == "elixibop/0.1.0 (https://github.com/derrickp/elixibop)"
  end

  test "returns expected headers" do
    expected = ["User-Agent": "elixibop/0.1.0 (https://github.com/derrickp/elixibop)"]
    assert Elixibop.Headers.headers() == expected
  end
end
