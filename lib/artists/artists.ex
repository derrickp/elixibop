import Elixibop.Artists.QueryParameters
alias Elixibop.Artists.Parsing
alias Elixibop.Artists.QueryOptions

defmodule Elixibop.Artists do

  def query(nil) do
    {:error, "No argument provided"}
  end

  def query(%QueryOptions{} = options, min_score \\ 0) do
    options
    |> build_url_params
    |> by_query
    |> Elixibop.Common.Filter.by_score(min_score)
  end

  def by_name(name, min_score \\ 0) do
    name
    |> queryize_name
    |> by_query
    |> Elixibop.Common.Filter.by_score(min_score)
  end

  def by_name_and_genres(name, genres, min_score \\ 0) do
    tag_query = queryize_genres(genres)
    name_query = queryize_name(name)

    build_url_params(name_query, tag_query)
    |> by_query
    |> Elixibop.Common.Filter.by_score(min_score)
  end

  def by_query(query) do
    Elixibop.Common.Query.perform(endpoint(), query, &handle_response/1)
  end

  def handle_response({:ok, body}) do
    body |> Parsing.from_xml
  end

  def handle_response({:error, error}) do
    error
  end

  def endpoint do
    "/artist"
  end
end
