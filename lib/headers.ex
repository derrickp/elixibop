import Elixibop.Config, only: [application_name: 0, version: 0, contact_info: 0]

defmodule Elixibop.Headers do
  @spec user_agent() :: String.t()
  def user_agent do
    "#{application_name()}/#{version()} (#{contact_info()})"
  end

  def headers do
    ["User-Agent": user_agent()]
  end
end
