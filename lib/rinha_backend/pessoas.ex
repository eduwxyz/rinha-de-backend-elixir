defmodule RinhaBackend.Pessoas do
  alias RinhaBackend.Pessoas.Create
  alias RinhaBackend.Pessoas.Get
  alias RinhaBackend.Pessoas.Count
  alias RinhaBackend.Pessoas.Search

  defdelegate create(params), to: Create, as: :call
  defdelegate get(uuid), to: Get, as: :call

  defdelegate count(), to: Count, as: :call

  defdelegate search(query_param), to: Search, as: :call
end
