defmodule RinhaBackendWeb.FallbackController do
  use RinhaBackendWeb, :controller

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(json: RinhaBackendWeb.ErrorJSON)
    |> render(:error, status: :not_found)
  end

  def call(conn, {:error, changeset}) do
    invalid_fields = [:nome, :apelido]
    status =
    if Enum.any?(invalid_fields, fn field -> is_invalid_type(changeset, field) end) do
      :bad_request
    else
      :unprocessable_entity
    end

    conn
    # 422
    |> put_status(status)
    |> put_view(json: RinhaBackendWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end

  defp is_invalid_type(changeset, field) do
    case Ecto.Changeset.get_field(changeset, field) do
      nil ->
        true

      value when not is_binary(value) or value == "" ->
        true

      _ ->
        false
    end
  end
end
