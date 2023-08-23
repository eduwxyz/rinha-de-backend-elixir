defmodule RinhaBackend.Pessoas.Get do
  alias RinhaBackend.Pessoas.Pessoa
  alias RinhaBackend.Repo


  def call(uuid) do
    if value = RinhaBackend.Cache.get(uuid) do
      {:ok, value}
    else
      case Repo.get(Pessoa, uuid) do
        {:ok, pessoa} ->
          RinhaBackend.Cache.put(uuid, pessoa)
          {:ok, pessoa}
        {:error, _} ->
          {:error, :not_found}
      end
    end
  end

  # defp handle_response({:ok, pessoa}), do: pessoa
  # defp handle_response({:error, changeset}), do: changeset
end
