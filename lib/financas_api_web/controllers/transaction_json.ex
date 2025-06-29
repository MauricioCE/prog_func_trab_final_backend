defmodule FinancasApiWeb.TransactionJSON do
  alias FinancasApi.Finances.Transaction

  @doc """
  Renders a list of transactions.
  """
  def index(%{transactions: transactions}) do
    %{data: for(transaction <- transactions, do: data(transaction))}
  end

  @doc """
  Renders a single transaction.
  """
  def show(%{transaction: transaction}) do
    %{data: data(transaction)}
  end

  defp data(%Transaction{} = transaction) do
    %{
      id: transaction.id,
      description: transaction.description,
      value: transaction.value,
      type: transaction.type,
      date: transaction.date,
      tags: Enum.map(transaction.tags || [], fn tag -> %{id: tag.id, name: tag.name} end)
    }
  end
end
