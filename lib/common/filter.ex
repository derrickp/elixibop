defmodule Elixibop.Common.Filter do

  def by_score(list, 0) do
    {:ok, list}
  end

  def by_score(list, min_score) do
    {:ok, Enum.filter(list, fn item -> item.score >= min_score end)}
  end
end
