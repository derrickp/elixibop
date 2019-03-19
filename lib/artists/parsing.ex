import SweetXml

alias Elixibop.Artists.{Artist}

defmodule Elixibop.Artists.Parsing do

  def artists_from_xml(xml_doc) do
    xml_doc
    |> parse_xml_doc
    |> build_artists
  end

  def build_artists(artist_list) do
    Enum.map(artist_list.artists, &build_artist/1)
  end

  def build_artist(artist_map) do
    %Artist{
      id: artist_map.id,
      name: artist_map.name,
      type: artist_map.type,
      score: artist_map.score,
      country: artist_map.country,
      disambiguation: artist_map.disambiguation,
      area: artist_map.area,
      begin_area: artist_map.begin_area,
      tags: artist_map.tags
    }
  end

  def parse_xml_doc(xml_doc) do
    xml_doc
    |> xmap(
      artists: [
        ~x"//artist-list/artist"l,
        id: ~x"./@id",
        name: ~x"./name/text()",
        type: ~x"./@type",
        score: ~x"@ns2:score"i,
        country: ~x"./country/text()",
        disambiguation: ~x"./disambiguation/text()"o,
        area: [
          ~x"./area"o,
          type: ~x"./@type",
          name: ~x"./name/text()"
        ],
        begin_area: [
          ~x"./begin-area"o,
          type: ~x"./@type",
          name: ~x"./name/text()"
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
