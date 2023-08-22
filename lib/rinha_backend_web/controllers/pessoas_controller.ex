defmodule RinhaBackendWeb.PessoasController do
  use RinhaBackendWeb, :controller

  alias RinhaBackend.Pessoas
  alias Pessoas.Pessoa

  action_fallback RinhaBackendWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Pessoa{} = pessoa} <- Pessoas.create(params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", "/pessoas/#{pessoa.uuid}")
      |> render(:create, pessoa: pessoa)

    end

end

  def search(conn, %{"t" => query_param}) do
    case Pessoas.search(query_param) do
      {:ok, pessoas} when is_list(pessoas) ->
        conn
        |> put_status(:ok)
        |> render(:search, pessoas: pessoas)
    end
  end

  def contagem_pessoas(conn, _params) do
    with {:ok, count} <- Pessoas.count() do
      conn
      |> put_status(:ok)
      |> render(:contagem_pessoas, count: count)
    end
  end

  def show(conn, %{"uuid" => uuid}) do
    with {:ok, %Pessoa{} = pessoa} <- Pessoas.get(uuid) do
      conn
      |> put_status(:ok)
      |> render(:show, pessoa: pessoa)
    end
  end

  # def handle_response({:ok, pessoa}, conn) do
  #   conn
  #   # 201
  #   |> put_status(:created)
  #   |> put_resp_header("location", "/pessoas/#{pessoa.uuid}")
  #   |> render(:create, pessoa: pessoa)
  # end
end
