defmodule RinhaBackend.Pessoas.Search do
  alias RinhaBackend.Pessoas.Pessoa
  alias RinhaBackend.Repo

  import Ecto.Query

  def call(query_param) do
    query =
      from p0 in Pessoa,
        where: ilike(p0.pesquisa, ^"%#{query_param}%"),
        limit: 50

    {:ok, Repo.all(query)}
  end
end
