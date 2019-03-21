defmodule Elixibop.Areas.Area do
  defstruct ~w[
    id
    name
    score
    type
    sort_name
    iso_3166_2_code_list
    life_span
    alias_list
    relation_list
  ]a

  def build(nil) do
    %Elixibop.Areas.Area{}
  end

  def build(area_map) do
    %Elixibop.Areas.Area{
      id: area_map.id,
      type: area_map.type,
      name: area_map.name,
      sort_name: area_map.sort_name,
      life_span: area_map.life_span
    }
  end
end

defmodule Elixibop.IsoCodeList do
  defstruct ~w[iso_3166_2_code]a
end

defmodule Elixibop.Alias do
  defstruct ~w[locale sort_name type primary text]a
end
