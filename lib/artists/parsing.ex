import SweetXml

alias Elixibop.Artists.Artist

defmodule Elixibop.Artists.Parsing do
  def from_xml(xml_doc) do
    xml_doc
    |> parse_xml_doc
    |> build_artists
  end

  def build_artists(artist_list) do
    Enum.map(artist_list.artists, &Artist.from_map/1)
  end

  def parse_xml_doc(xml_doc) do
    xml_doc
    |> xmap(
      artists: [
        ~x"//artist-list/artist"l,
        id: ~x"./@id",
        name: ~x"./name/text()",
        sort_name: ~x"./sort-name/text()",
        type: ~x"./@type",
        score: ~x"@ns2:score"i,
        country: ~x"./country/text()",
        disambiguation: ~x"./disambiguation/text()"o,
        area: Elixibop.Areas.Parsing.parse_area("area"),
        begin_area: Elixibop.Areas.Parsing.parse_area("begin-area"),
        tags: [
          ~x"./tag-list/tag"ol,
          count: ~x"./@count",
          name: ~x"./name/text()"
        ]
      ]
    )
  end
end
