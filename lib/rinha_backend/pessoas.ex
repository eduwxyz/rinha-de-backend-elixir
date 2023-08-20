defmodule RinhaBackend.Pessoas do


  alias RinhaBackend.Pessoas.Create
  alias RinhaBackend.Pessoas.Get

  defdelegate create(params), to: Create, as: :call
  defdelegate get(uuid), to: Get, as: :call


end
