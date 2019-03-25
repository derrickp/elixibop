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

  def from_map(nil) do
    %Elixibop.Areas.Area{}
  end

  def from_map(area_map) do
    %Elixibop.Areas.Area{
      id: area_map[:id],
      type: area_map[:type],
      name: area_map[:name],
      score: area_map[:score],
      sort_name: area_map[:sort_name],
      life_span: area_map[:life_span],
      relation_list: build_relation_list(area_map[:relation_list]),
      alias_list: area_map[:alias_list],
      iso_3166_2_code_list: build_code_list(area_map[:iso_3166_2_code_list])
    }
  end

  def build_relation_list(nil) do
    []
  end

  def build_relation_list(list) do
    Enum.map(list, fn relation -> relation_from_map(relation) end)
  end

  def build_code_list(nil) do
    []
  end

  def build_code_list(list) do
    Enum.map(list, fn item -> item[:code] end)
  end

  def relation_from_map(nil) do
    %{}
  end

  def relation_from_map(relation_map) do
    %{
      target: relation_map[:target],
      direction: relation_map[:direction],
      area: from_map(relation_map[:area])
    }
  end
end

defmodule Elixibop.Alias do
  defstruct ~w[locale sort_name type primary text]a
end
