defmodule Elixibop.LifeSpans.LifeSpan do
  defstruct ~w[begin end ended]a

  alias Elixibop.LifeSpans.LifeSpan

  def from_map(nil) do
    %LifeSpan{}
  end

  def from_map(life_span_map) do
    %LifeSpan{
      begin: life_span_map[:begin],
      end: life_span_map[:end],
      ended: life_span_map[:ended]
    }
  end
end
