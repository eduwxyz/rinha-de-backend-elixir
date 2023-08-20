defmodule RinhaBackendWeb.PessoasJSON do
  def create(%{pessoa: pessoa}) do
    %{
      message: "Pessoa criada com sucesso",
      id: pessoa.uuid
    }
  end



  def show(%{pessoa: pessoa}) do
    %{
      id: pessoa.uuid,
      nome: pessoa.nome,
      apelido: pessoa.apelido,
      stack: pessoa.stack,
    }
  end

end
