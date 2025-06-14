defmodule FinancasApiWeb.Auth.AuthController do
  use FinancasApiWeb, :controller

  alias FinancasApi.Accounts
  alias FinancasApiWeb.Auth.Token

  ## POST /api/login
  def login(conn, %{"email" => email, "password" => password}) do
    case Accounts.authenticate_user(email, password) do
      {:ok, user} ->
        {:ok, token, _claims} = Token.gerar_token(%{"user_id" => user.id})
        json(conn, %{message: "Login bem-sucedido", token: token, user_id: user.id})

      {:error, :unauthorized} ->
        IO.puts("Credenciais inválidas ou usuário não cadastrado")
        IO.inspect(%{"email" => email, "password" => password})

        conn
        |> put_status(:unauthorized)
        |> json(%{error: "Credenciais inválidas"})
    end
  end

  ## POST /api/register
  def register(conn, %{"email" => _} = params) do
    with {:ok, user} <- Accounts.create_user(params),
         {:ok, token, _} <- Token.gerar_token(%{"user_id" => user.id}) do
      conn
      |> put_status(:created)
      |> json(%{message: "Usuário criado", token: token, user_id: user.id})
    else
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{errors: Ecto.Changeset.traverse_errors(changeset, &translate_error/1)})
    end
  end

  defp translate_error({msg, _opts}), do: msg
end
