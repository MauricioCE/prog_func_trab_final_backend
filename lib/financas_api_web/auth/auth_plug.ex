defmodule FinancasApiWeb.Auth.AuthPlug do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, _claims} <- FinancasApiWeb.Auth.Token.validar_token(token) do
      conn
    else
      _ ->
        conn
        |> send_resp(:unauthorized, "Token inválido ou ausente")
        |> halt()
    end
  end
end
