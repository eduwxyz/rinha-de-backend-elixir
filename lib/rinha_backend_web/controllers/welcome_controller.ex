defmodule RinhaBackendWeb.WelcomeController do
  use RinhaBackendWeb, :controller

  def index(conn, _params) do
    conn
    |> json(%{message: "Welcome to Rinha API", status: 200})

    conn
  end
end
