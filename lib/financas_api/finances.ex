defmodule FinancasApi.Finances do
  @moduledoc """
  The Finances context.
  """

  import Ecto.Query, warn: false
  alias FinancasApi.Repo

  alias FinancasApi.Finances.Transaction
  alias FinancasApi.Tagging.Tag

  def list_transactions do
    Repo.all(Transaction)
  end

  def list_transactions_by_user(user_id) do
    from(t in Transaction, where: t.user_id == ^user_id)
    |> Repo.all()
    |> Repo.preload([:tags_assoc, :user])
  end

  def list_tags_by_user(user_id) do
    from(tag in Tag, where: tag.user_id == ^user_id)
    |> Repo.all()
  end

  def get_transaction!(user_id), do: Repo.get!(Transaction, user_id)

  def create_transaction(attrs \\ %{}) do
    %Transaction{}
    |> Transaction.changeset(attrs)
    |> handle_tags(attrs)
    |> Repo.insert()
  end

  def update_transaction(%Transaction{} = transaction, attrs) do
    transaction
    |> Transaction.changeset(attrs)
    |> handle_tags(attrs)
    |> Repo.update()
  end

  def delete_transaction(%Transaction{} = transaction) do
    Repo.delete(transaction)
  end

  def change_transaction(%Transaction{} = transaction, attrs \\ %{}) do
    Transaction.changeset(transaction, attrs)
  end

  defp handle_tags(changeset, attrs) do
    case Map.get(attrs, "tags") do
      nil ->
        changeset

      tags when is_list(tags) ->
        tag_ids = Enum.map(tags, fn %{"id" => id} -> id end)
        tags_structs = Repo.all(from t in Tag, where: t.id in ^tag_ids)
        Ecto.Changeset.put_assoc(changeset, :tags_assoc, tags_structs)
    end
  end
end
