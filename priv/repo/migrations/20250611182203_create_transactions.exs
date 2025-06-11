defmodule FinancasApi.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :description, :string
      add :value, :decimal
      add :type, :string
      add :date, :utc_datetime
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:transactions, [:user_id])
  end
end
