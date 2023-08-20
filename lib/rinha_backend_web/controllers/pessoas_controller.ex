defmodule RinhaBackendWeb.PessoasController do
  use RinhaBackendWeb, :controller

  alias RinhaBackend.Pessoas.Create

  def create(conn, params) do
    params
    |> Create.call()
    |> handle_response(conn)
  end

  def handle_response({:ok, pessoa}, conn) do
    conn
    # 201
    |> put_status(:created)
    |> put_resp_header("location", "/pessoas/#{pessoa.uuid}")
    |> render(:create, pessoa: pessoa)
  end

  # def handle_response({:error, _changeset}, conn) do
  #   conn
  #   # 422
  #   |> put_status(:unprocessable_entity)
  #   |> render("error.json", error: :error)
  # end
end
