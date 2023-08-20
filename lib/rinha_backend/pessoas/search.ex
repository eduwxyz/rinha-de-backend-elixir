defmodule RinhaBackend.Pessoas.Search do
  alias RinhaBackend.Pessoas.Pessoa
  alias RinhaBackend.Repo

  import Ecto.Query

  def call(query_param) do
    query =
      from p0 in Pessoa,
        where: ilike(p0.nome, ^"%#{query_param}%") or
               ilike(p0.apelido, ^"%#{query_param}%") or
               fragment("? = ANY(p0.stack)", ^query_param)

    Repo.all(query)
  end
end
