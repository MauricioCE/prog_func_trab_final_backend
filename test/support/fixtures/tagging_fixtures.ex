defmodule FinancasApi.TaggingFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FinancasApi.Tagging` context.
  """

  @doc """
  Generate a tag.
  """
  def tag_fixture(attrs \\ %{}) do
    {:ok, tag} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> FinancasApi.Tagging.create_tag()

    tag
  end
end
