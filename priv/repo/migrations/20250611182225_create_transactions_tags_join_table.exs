defmodule FinancasApi.Repo.Migrations.CreateTransactionsTagsJoinTable do
  use Ecto.Migration

  def change do
    create table(:transactions_tags, primary_key: false) do
      add :transaction_id, references(:transactions, on_delete: :delete_all)
      add :tag_id, references(:tags, on_delete: :delete_all)
    end

    create unique_index(:transactions_tags, [:transaction_id, :tag_id])
  end
end
