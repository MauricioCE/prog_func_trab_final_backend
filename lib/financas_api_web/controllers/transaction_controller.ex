defmodule FinancasApiWeb.TransactionController do
  use FinancasApiWeb, :controller

  alias FinancasApi.Finances
  alias FinancasApi.Finances.Transaction

  action_fallback FinancasApiWeb.FallbackController

  def index(conn, _params) do
    transactions = Finances.list_transactions()
    render(conn, :index, transactions: transactions)
  end

  def create(conn, %{"transaction" => transaction_params}) do
    with {:ok, %Transaction{} = transaction} <- Finances.create_transaction(transaction_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/transactions/#{transaction}")
      |> render(:show, transaction: transaction)
    end
  end

  def show(conn, %{"id" => id}) do
    transaction = Finances.get_transaction!(id)
    render(conn, :show, transaction: transaction)
  end

  def update(conn, %{"id" => id, "transaction" => transaction_params}) do
    transaction = Finances.get_transaction!(id)

    with {:ok, %Transaction{} = transaction} <- Finances.update_transaction(transaction, transaction_params) do
      render(conn, :show, transaction: transaction)
    end
  end

  def delete(conn, %{"id" => id}) do
    transaction = Finances.get_transaction!(id)

    with {:ok, %Transaction{}} <- Finances.delete_transaction(transaction) do
      send_resp(conn, :no_content, "")
    end
  end
end
