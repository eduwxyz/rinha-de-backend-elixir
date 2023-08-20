defmodule RinhaBackendWeb.PessoasJSON do
  def create(%{pessoa: pessoa}) do
    %{
      message: "Pessoa criada com sucesso",
      id: pessoa.uuid
    }
  end

  def contagem_pessoas(%{count: count}) do
    %{
      message: "Contagem de pessoas",
      count: count
    }
  end

  def search() do

    []
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
