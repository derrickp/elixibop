defmodule Elixibop.Artists.QueryParameters do
  def queryize_name(name) do
    name
    |> URI.encode_www_form()
  end

  def build_url_params(name_query, "") do
    name_query
  end

  def build_url_params(name_query, tag_query) do
    (name_query <> URI.encode_www_form(" AND ") <> tag_query)
  end

  def queryize_genres(genres) do
    genres
    |> Enum.map(fn genre -> "tag:" <> URI.encode_www_form(genre) end)
    |> Enum.join(URI.encode_www_form(" OR "))
    |> final_tag
  end

  def final_tag("") do
    ""
  end

  def final_tag(query) do
    "(" <> query <> ")"
  end
end
