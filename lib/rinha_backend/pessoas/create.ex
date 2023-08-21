defmodule RinhaBackend.Pessoas.Create do
  alias RinhaBackend.Pessoas.Pessoa
  alias RinhaBackend.Repo

  def call(params) do
    params_new = add_pesquisa_field(params)

    params_new
    |> Pessoa.changeset()
    |> Repo.insert()

    # |> handle_response()
  end

  def add_pesquisa_field(params) do
    nome = Map.get(params, "nome", "")
    apelido = Map.get(params, "apelido", "")
    stack = Map.get(params, "stack", [])

    stack_list =
      case stack do
        nil -> []
        _ -> stack
      end

    pesquisa = nome <> " " <> apelido <> " " <> Enum.join(stack_list, " ")

    Map.put(params, "pesquisa", pesquisa)
  end

  # defp handle_response({:ok, pessoa}), do: pessoa
  # defp handle_response({:error, changeset}), do: changeset
end
