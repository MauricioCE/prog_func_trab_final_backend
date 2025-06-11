defmodule FinancasApi.FinancesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FinancasApi.Finances` context.
  """

  @doc """
  Generate a transaction.
  """
  def transaction_fixture(attrs \\ %{}) do
    {:ok, transaction} =
      attrs
      |> Enum.into(%{
        date: ~U[2025-06-10 18:22:00Z],
        description: "some description",
        type: "some type",
        value: "120.5"
      })
      |> FinancasApi.Finances.create_transaction()

    transaction
  end
end
