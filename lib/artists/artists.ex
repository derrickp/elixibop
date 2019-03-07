import Elixibop.Headers, only: [headers: 0]

defmodule Elixibop.Artists do
  def by_name(name) do
    name
    |> queryize_name
    |> by_query
  end

  def by_name_and_genres(name, genres) do
    tag_query = queryize_genres(genres)
    name_query = queryize_name(name)
    name_query <> URI.encode_www_form(" AND ") <> tag_query
    |> by_query
  end

  defp queryize_name(name) do
    name
    |> URI.encode_www_form
    |> (&("artist:" <> &1)).()
  end

  defp queryize_genres(genres) do
    genres
    |> Enum.map(fn genre -> "tag:" <> URI.encode_www_form(genre) end)
    |> Enum.join(URI.encode_www_form(" OR "))
    |> (fn query -> "(" <> query <> ")" end).()
  end

  defp by_query(query) do
    url = base_url() <> "?query=" <> query
    IO.puts(url)
    HTTPotion.get(url, headers: headers())
  end

  def base_url do
    Application.get_env(:elixibop, :musicbrainz_url) <> "/artist"
  end
end
