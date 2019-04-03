alias Elixibop.Artists.QueryOptions

defmodule Elixibop.Artists.QueryParameters do
  def build_url_params(%QueryOptions{} = options) do
    IO.puts(inspect(options))
    params = [
      queryize_id(options.id),
      queryize_name(options.name),
      queryize_genres(options.tags),
      queryize_type(options.type),
      queryize_country(options.country)
    ]
    IO.puts(inspect(params))
    filtered = Enum.reject(params, &nil?/1)
    join_params(filtered)
  end

  def build_url_params(name_query, "") do
    name_query
  end

  def build_url_params(name_query, tag_query) do
    (name_query <> URI.encode_www_form(" AND ") <> tag_query)
  end

  def queryize_name(nil) do
    nil
  end

  def queryize_name(name) do
    name
    |> URI.encode_www_form()
    |> (&("artistaccent:" <> &1)).()
  end

  def join_params(params) do
    Enum.join(params, URI.encode_www_form(" AND "))
  end

  def queryize_id(nil) do
    nil
  end

  def queryize_id(id) do
    "arid:#{id}"
  end

  def queryize_type(nil) do
    nil
  end

  def queryize_type(type) do
    "type:#{type}"
  end

  def queryize_country(nil) do
    nil
  end

  def queryize_country(country) do
    "country:#{country}"
  end

  def queryize_genres(nil) do
    nil
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

  def nil?(nil) do
    true
  end

  def nil?(_arg) do
    false
  end
end
