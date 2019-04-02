import SweetXml

alias Elixibop.Areas.Area

defmodule Elixibop.Areas.Parsing do
  def from_xml(xml_doc) do
    xml_doc
    |> parse_xml
    |> build_areas
  end

  def build_areas(area_list) do
    Enum.map(area_list.areas, &Area.from_map/1)
  end

  def parse_xml(xml_doc) do
    xml_doc
    |> xmap(
      areas: [
        ~x"//area-list/area"l,
        id: ~x"./@id",
        name: ~x"./name/text()",
        sort_name: ~x"./sort-name/text()",
        type: ~x"./@type",
        score: ~x"@ns2:score"i,
        relation_list: [
          ~x"./relation-list/relation"ol,
          type: ~x"./@type",
          target: ~x"./target/text()",
          direction: ~x"./direction/text()",
          area: parse_tag("area"),
        ],
        life_span: Elixibop.LifeSpans.Parsing.parse_tag("life-span"),
        iso_3166_2_code_list: [
          ~x"./iso-3166-2-code-list/iso-3166-2-code"ol,
          code: ~x"./text()"
        ]
      ]
    )
  end

  def parse_tag(tag_name) do
    [
      ~x"./#{tag_name}"o,
      id: ~x"./@id",
      type: ~x"./@type",
      name: ~x"./name/text()",
      sort_name: ~x"./sort-name/text()",
      life_span: [
        ~x"./life-span"o,
        ended: ~x"./ended/text()"
      ]
    ]
  end
end
