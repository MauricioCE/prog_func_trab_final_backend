defmodule FinancasApi.Finances.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, except: [:__meta__, :user, :tags_assoc]}
  schema "transactions" do
    field :type, :string
    field :value, :decimal
    field :date, :utc_datetime
    field :description, :string
    field :tags, {:array, :integer}, virtual: true

    belongs_to :user, FinancasApi.Accounts.User

    many_to_many :tags_assoc, FinancasApi.Tagging.Tag,
      join_through: "transactions_tags",
      on_replace: :delete

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:description, :value, :type, :date, :user_id])
    |> validate_required([:description, :value, :type, :date, :user_id])
    |> assoc_constraint(:user)
    |> cast_assoc(:tags_assoc)
  end
end
