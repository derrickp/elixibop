defmodule Elixibop.ConfigTest do
  use ExUnit.Case
  doctest Elixibop.Config

  test "returns the version" do
    assert Elixibop.Config.version() == "0.1.0"
  end

  test "returns configured contact info" do
    assert Elixibop.Config.contact_info() == "https://github.com/derrickp/elixibop"
  end

  test "returns configured app name" do
    assert Elixibop.Config.application_name() == "elixibop"
  end
end
