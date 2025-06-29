defmodule FinancasApi.Tagging do
  @moduledoc """
  The Tagging context.
  """

  import Ecto.Query, warn: false
  alias FinancasApi.Repo

  alias FinancasApi.Tagging.Tag

  def list_tags do
    Repo.all(Tag)
  end

  def list_tags_by_user(user_id) do
    from(t in Tag, where: t.user_id == ^user_id)
    |> Repo.all()
  end

  def get_tag!(id), do: Repo.get!(Tag, id)

  def create_tag(attrs \\ %{}) do
    %Tag{}
    |> Tag.changeset(attrs)
    |> Repo.insert()
  end

  def update_tag(%Tag{} = tag, attrs) do
    tag
    |> Tag.changeset(attrs)
    |> Repo.update()
  end

  def delete_tag(%Tag{} = tag) do
    Repo.delete(tag)
  end

  def change_tag(%Tag{} = tag, attrs \\ %{}) do
    Tag.changeset(tag, attrs)
  end
end
