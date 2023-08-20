defmodule RinhaBackend.Pessoas.Create do
  alias RinhaBackend.Pessoas.Pessoa
  alias RinhaBackend.Repo

  def call(params) do
    params
    |> Pessoa.changeset()
    |> Repo.insert()

    # |> handle_response()
  end

  # defp handle_response({:ok, pessoa}), do: pessoa
  # defp handle_response({:error, changeset}), do: changeset
end
