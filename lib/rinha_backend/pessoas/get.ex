defmodule RinhaBackend.Pessoas.Get do
  alias RinhaBackend.Pessoas.Pessoa
  alias RinhaBackend.Repo

  def call(uuid) do
    case Repo.get(Pessoa, uuid) do
      pessoa -> {:ok, pessoa}
      _ -> {:error, :not_found}
    end
  end

  # defp handle_response({:ok, pessoa}), do: pessoa
  # defp handle_response({:error, changeset}), do: changeset
end
