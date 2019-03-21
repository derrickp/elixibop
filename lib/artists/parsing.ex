import SweetXml

alias Elixibop.Artists.Artist

defmodule Elixibop.Artists.Parsing do
  def artists_from_xml(xml_doc) do
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
        area: [
          ~x"./area"o,
          id: ~x"./@id",
          type: ~x"./@type",
          name: ~x"./name/text()",
          sort_name: ~x"./sort-name/text()",
          life_span: [
            ~x"./life-span"o,
            ended: ~x"./ended/text()"
          ]
        ],
        begin_area: [
          ~x"./begin-area"o,
          id: ~x"./@id",
          type: ~x"./@type",
          name: ~x"./name/text()",
          sort_name: ~x"./sort-name/text()",
          life_span: [
            ~x"./life-span"o,
            ended: ~x"./ended/text()"
          ]
        ],
        tags: [
          ~x"./tag-list/tag"ol,
          count: ~x"./@count",
          name: ~x"./name/text()"
        ]
      ]
    )
  end
end
