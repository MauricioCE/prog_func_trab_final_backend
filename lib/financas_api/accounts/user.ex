defmodule FinancasApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pbkdf2

  @derive {Jason.Encoder, only: [:id, :name, :email]}
  schema "users" do
    field :name, :string
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    has_many :transactions, FinancasApi.Finances.Transaction
    has_many :tags, FinancasApi.Tagging.Tag

    timestamps(type: :utc_datetime)
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password])
    |> validate_required([:name, :email, :password])
    |> validate_length(:password, min: 6, message: "deve ter pelo menos 6 caracteres")
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(password))

      _ ->
        changeset
    end
  end
end
