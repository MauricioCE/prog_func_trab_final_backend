defmodule FinancasApi.Finances.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transactions" do
    field :type, :string
    field :value, :decimal
    field :date, :utc_datetime
    field :description, :string
    belongs_to :user, FinancasApi.Accounts.User
    many_to_many :tags, FinancasApi.Tagging.Tag, join_through: "transactions_tags"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:description, :value, :type, :date, :user_id])
    |> validate_required([:description, :value, :type, :date, :user_id])
    |> assoc_constraint(:user)
  end
end
