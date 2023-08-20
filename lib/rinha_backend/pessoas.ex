defmodule RinhaBackend.Pessoas do


  alias RinhaBackend.Pessoas.Create
  alias RinhaBackend.Pessoas.Get
  alias RinhaBackend.Pessoas.Count

  defdelegate create(params), to: Create, as: :call
  defdelegate get(uuid), to: Get, as: :call

  defdelegate count(), to: Count, as: :call


end
