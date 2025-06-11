defmodule FinancasApiWeb.TagController do
  use FinancasApiWeb, :controller

  alias FinancasApi.Tagging
  alias FinancasApi.Tagging.Tag

  action_fallback FinancasApiWeb.FallbackController

  def index(conn, _params) do
    tags = Tagging.list_tags()
    render(conn, :index, tags: tags)
  end

  def create(conn, %{"tag" => tag_params}) do
    with {:ok, %Tag{} = tag} <- Tagging.create_tag(tag_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/tags/#{tag}")
      |> render(:show, tag: tag)
    end
  end

  def show(conn, %{"id" => id}) do
    tag = Tagging.get_tag!(id)
    render(conn, :show, tag: tag)
  end

  def update(conn, %{"id" => id, "tag" => tag_params}) do
    tag = Tagging.get_tag!(id)

    with {:ok, %Tag{} = tag} <- Tagging.update_tag(tag, tag_params) do
      render(conn, :show, tag: tag)
    end
  end

  def delete(conn, %{"id" => id}) do
    tag = Tagging.get_tag!(id)

    with {:ok, %Tag{}} <- Tagging.delete_tag(tag) do
      send_resp(conn, :no_content, "")
    end
  end
end
