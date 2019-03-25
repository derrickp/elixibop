alias Elixibop.Areas.Parsing

defmodule Elixibop.Areas do
  def by_id(id) do
    id
    |> queryize_id
    |> by_query
  end

  def by_name(name, min_score \\ 0) do
    name
    |> URI.encode_www_form()
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

  def queryize_id(id) do
    "aid:#{id}"
  end

  def endpoint do
    "/area"
  end
end
