defmodule FinancasApi.FinancesTest do
  use FinancasApi.DataCase

  alias FinancasApi.Finances

  describe "transactions" do
    alias FinancasApi.Finances.Transaction

    import FinancasApi.FinancesFixtures

    @invalid_attrs %{type: nil, value: nil, date: nil, description: nil}

    test "list_transactions/0 returns all transactions" do
      transaction = transaction_fixture()
      assert Finances.list_transactions() == [transaction]
    end

    test "get_transaction!/1 returns the transaction with given id" do
      transaction = transaction_fixture()
      assert Finances.get_transaction!(transaction.id) == transaction
    end

    test "create_transaction/1 with valid data creates a transaction" do
      valid_attrs = %{type: "some type", value: "120.5", date: ~U[2025-06-10 18:22:00Z], description: "some description"}

      assert {:ok, %Transaction{} = transaction} = Finances.create_transaction(valid_attrs)
      assert transaction.type == "some type"
      assert transaction.value == Decimal.new("120.5")
      assert transaction.date == ~U[2025-06-10 18:22:00Z]
      assert transaction.description == "some description"
    end

    test "create_transaction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Finances.create_transaction(@invalid_attrs)
    end

    test "update_transaction/2 with valid data updates the transaction" do
      transaction = transaction_fixture()
      update_attrs = %{type: "some updated type", value: "456.7", date: ~U[2025-06-11 18:22:00Z], description: "some updated description"}

      assert {:ok, %Transaction{} = transaction} = Finances.update_transaction(transaction, update_attrs)
      assert transaction.type == "some updated type"
      assert transaction.value == Decimal.new("456.7")
      assert transaction.date == ~U[2025-06-11 18:22:00Z]
      assert transaction.description == "some updated description"
    end

    test "update_transaction/2 with invalid data returns error changeset" do
      transaction = transaction_fixture()
      assert {:error, %Ecto.Changeset{}} = Finances.update_transaction(transaction, @invalid_attrs)
      assert transaction == Finances.get_transaction!(transaction.id)
    end

    test "delete_transaction/1 deletes the transaction" do
      transaction = transaction_fixture()
      assert {:ok, %Transaction{}} = Finances.delete_transaction(transaction)
      assert_raise Ecto.NoResultsError, fn -> Finances.get_transaction!(transaction.id) end
    end

    test "change_transaction/1 returns a transaction changeset" do
      transaction = transaction_fixture()
      assert %Ecto.Changeset{} = Finances.change_transaction(transaction)
    end
  end
end
