defmodule FinancasApi.Tagging.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :name, :string
    belongs_to :user, FinancasApi.Accounts.User

    many_to_many :transactions, FinancasApi.Finances.Transaction,
      join_through: "transactions_tags"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name, :user_id])
    |> validate_required([:name, :user_id])
    |> assoc_constraint(:user)
    |> unique_constraint(:name, name: :tags_user_id_name_index)
  end
end
