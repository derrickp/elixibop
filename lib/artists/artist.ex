alias Elixibop.Areas.Area

defmodule Elixibop.Artists.Artist do
  defstruct ~w[
    id
    type
    score
    name
    country
    area
    begin_area
    disambiguation
    tags
  ]a

  def from_map(nil) do
    %Elixibop.Artists.Artist{}
  end

  def from_map(%{} = artist_map) do
    %Elixibop.Artists.Artist{
      id: artist_map.id,
      name: artist_map.name,
      type: artist_map.type,
      score: artist_map.score,
      country: artist_map.country,
      disambiguation: artist_map.disambiguation,
      area: Area.from_map(artist_map.area),
      begin_area: Area.from_map(artist_map.begin_area),
      tags: artist_map.tags
    }
  end
end
