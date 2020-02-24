defmodule ContactWeb.EdgeController do
  use ContactWeb, :controller

  alias Contact.Graph
  alias Contact.Graph.Edge

  def index(conn, _params) do
    edges = Graph.list_edges()
    render(conn, "index.html", edges: edges)
  end

  def new(conn, _params) do
    changeset = Graph.change_edge(%Edge{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"edge" => edge_params}) do
    case Graph.create_edge(edge_params) do
      {:ok, edge} ->
        conn
        |> put_flash(:info, "Edge created successfully.")
        |> redirect(to: Routes.edge_path(conn, :show, edge))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    edge = Graph.get_edge!(id)
    render(conn, "show.html", edge: edge)
  end

  def edit(conn, %{"id" => id}) do
    edge = Graph.get_edge!(id)
    changeset = Graph.change_edge(edge)
    render(conn, "edit.html", edge: edge, changeset: changeset)
  end

  def update(conn, %{"id" => id, "edge" => edge_params}) do
    edge = Graph.get_edge!(id)

    case Graph.update_edge(edge, edge_params) do
      {:ok, edge} ->
        conn
        |> put_flash(:info, "Edge updated successfully.")
        |> redirect(to: Routes.edge_path(conn, :show, edge))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", edge: edge, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    edge = Graph.get_edge!(id)
    {:ok, _edge} = Graph.delete_edge(edge)

    conn
    |> put_flash(:info, "Edge deleted successfully.")
    |> redirect(to: Routes.edge_path(conn, :index))
  end
end
