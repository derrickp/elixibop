defmodule Elixibop.Area do
  defstruct ~w[
    id
    name
    sort_name
    iso_3166_2_code_list
    life_span
    alias_list
  ]a
end

defmodule Elixibop.IsoCodeList do
  defstruct ~w[iso_3166_2_code]a
end

defmodule Elixibop.Alias do
  defstruct ~w[locale sort_name type primary text]a
end
