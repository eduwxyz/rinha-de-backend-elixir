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

  # def handle_response({:ok, pessoa}, conn) do
  #   conn
  #   # 201
  #   |> put_status(:created)
  #   |> put_resp_header("location", "/pessoas/#{pessoa.uuid}")
  #   |> render(:create, pessoa: pessoa)
  # end
end
