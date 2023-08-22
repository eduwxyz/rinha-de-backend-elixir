defmodule RinhaBackend.Pessoas.Create do
  alias RinhaBackend.Pessoas.Pessoa
  alias RinhaBackend.Repo

  def call(params) do
    params_with_pesquisa = add_pesquisa_field(params)
    changeset = Pessoa.changeset(%Pessoa{}, params_with_pesquisa)

    Repo.insert(changeset)
  end

  def add_pesquisa_field(%{"nome" => nome, "apelido" => apelido, "stack" => stack} = params) do
    stack_list =
      case stack do
        nil -> []
        s when is_list(s) -> s
        s when is_binary(s) -> String.split(s, " ")
        _ -> []
      end

    nome_string = to_string(nome)

    apelido_string = to_string(apelido)

    pesquisa =
      nome_string <> " " <> apelido_string <> " " <> Enum.join(stack_list, " ")

    Map.put(params, "pesquisa", pesquisa)
  end
end
