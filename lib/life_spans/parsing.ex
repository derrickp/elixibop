import SweetXml

defmodule Elixibop.LifeSpans.Parsing do
  def parse_tag(tag_name) do
    [
      ~x"./#{tag_name}"o,
      begin: ~x"./begin/text()"o,
      end: ~x"./end/text()"o,
      ended: ~x"./ended/text()"o,
    ]
  end
end
