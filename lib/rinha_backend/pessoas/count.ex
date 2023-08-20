defmodule RinhaBackend.Pessoas.Count do
  alias RinhaBackend.Pessoas.Pessoa
  alias RinhaBackend.Repo

  def call() do
    {
      :ok,
      Repo.aggregate(Pessoa, :count, :uuid)
    }
  end

  # defp handle_response({:ok, pessoa}), do: pessoa
  # defp handle_response({:error, changeset}), do: changeset
end
