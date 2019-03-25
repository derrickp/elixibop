import Elixibop.Headers, only: [headers: 0]

defmodule Elixibop.Common.Query do
  def perform(endpoint, query, callback) do
    query_url = base_url() <> endpoint <> "?query=" <> query
    IO.puts(query_url)

    response = HTTPotion.get(query_url, headers: headers())
    handle_response(response, callback)
  end

  def handle_response(%HTTPotion.Response{} = response, callback) do
    callback.({:ok, response.body})
  end

  def handle_response(%HTTPotion.ErrorResponse{} = response, callback) do
    callback.({:error, response.body})
  end

  def base_url do
    Application.get_env(:elixibop, :musicbrainz_url)
  end
end
