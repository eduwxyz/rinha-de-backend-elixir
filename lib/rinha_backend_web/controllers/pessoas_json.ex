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

  def error(%{message: message}) do
    %{
      message: message
    }
  end

  def search(%{pessoas: pessoas}) do
    %{
      data: render_pessoas(pessoas)
    }
  end

  defp render_pessoas(pessoas) do
    Enum.map(pessoas, &render_pessoa/1)
  end

  defp render_pessoa(pessoa) do
    %{
      uuid: pessoa.uuid,
      nome: pessoa.nome,
      apelido: pessoa.apelido,
      nascimento: pessoa.nascimento,
      stack: pessoa.stack
    }
  end

  def show(%{pessoa: pessoa}) do
    %{
      id: pessoa.uuid,
      nome: pessoa.nome,
      apelido: pessoa.apelido,
      stack: pessoa.stack
    }
  end
end
