import Elixibop.Headers, only: [headers: 0]
import Elixibop.Artists.QueryParameters
import Elixibop.Artists.Parsing

defmodule Elixibop.Artists do
  def by_name(name) do
    name
    |> queryize_name
    |> by_query
  end

  def by_name_and_genres(name, genres, min_score \\ 0) do
    tag_query = queryize_genres(genres)
    name_query = queryize_name(name)

    build_url_params(name_query, tag_query)
    |> by_query
    |> filter_by_score(min_score)
  end

  def filter_by_score(artist_list, 0) do
    [:ok, artist_list]
  end

  def filter_by_score(artist_list, min_score) do
    [:ok, Enum.filter(artist_list, fn artist -> artist.score >= min_score end)]
  end

  def by_query(query) do
    url = base_url() <> "?query=" <> query
    IO.puts(url)

    HTTPotion.get(url, headers: headers())
    |> handle_response
  end

  def handle_response(%HTTPotion.Response{} = response) do
    response.body |> artists_from_xml
  end

  def handle_response(%HTTPotion.ErrorResponse{} = error_response) do
    error_response
  end

  def base_url do
    Application.get_env(:elixibop, :musicbrainz_url) <> "/artist"
  end
end
