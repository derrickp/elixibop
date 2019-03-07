defmodule Elixibop.Config do
  @spec version() :: String.t()
  def version do
    Mix.Project.config[:version]
  end

  @spec contact_info() :: String.t()
  def contact_info do
    Application.get_env(:elixibop, :contact_info)
  end

  def application_name do
    Application.get_env(:elixibop, :app_name)
  end
end
