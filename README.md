# Elixibop

**An Elixir wrapper around the [musicbrainz XML search API](https://musicbrainz.org/doc/Development/XML_Web_Service/Version_2/Search)**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elixibop` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elixibop, "~> 0.1.0"}
  ]
end
```

## Configuration
When querying the Musicbrainz API, they need a header that lets them identify the application that is making the calls, and the ability for them to contact the owner (or user). If this is not present there is a higher chance of being rate-limited or blocked from searching. To configure the library, place the following in the `config.exs` file.

```elixir
config :elixibop,
  app_name: "APP_NAME",
  contact_info: "Some contact information (e.g. git repo)",
  musicbrainz_url: "https://musicbrainz.org/ws/2" # Url to the base musicbrainz to be queried
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/elixibop](https://hexdocs.pm/elixibop).

