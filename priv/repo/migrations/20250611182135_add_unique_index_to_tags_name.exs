defmodule FinancasApi.Repo.Migrations.AddUniqueIndexToTagsName do
  use Ecto.Migration

  def change do
    create unique_index(:tags, [:user_id, :name], name: :tags_user_id_name_index)
  end
end
