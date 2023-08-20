defmodule RinhaBackendWeb.PessoasJSON do
  def create(%{pessoa: pessoa}) do
    %{
      message: "Pessoa criada com sucesso",
      id: pessoa.uuid
    }
  end
end
