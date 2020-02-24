defmodule ContactWeb.Api.EdgeController do
  use ContactWeb, :controller

  alias Contact.Graph
  alias Contact.Graph.Edge

  action_fallback ContactWeb.FallbackController

  def index(conn, _params) do
    edges = Graph.list_edges()
    render(conn, "index.json", edges: edges)
  end

  def create(conn, %{"edge" => edge_params}) do
    with {:ok, %Edge{} = edge} <- Graph.create_edge(edge_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_edge_path(conn, :show, edge))
      |> render("show.json", edge: edge)
    end
  end

  def show(conn, %{"id" => id}) do
    edge = Graph.get_edge!(id)
    render(conn, "show.json", edge: edge)
  end

  def update(conn, %{"id" => id, "edge" => edge_params}) do
    edge = Graph.get_edge!(id)

    with {:ok, %Edge{} = edge} <- Graph.update_edge(edge, edge_params) do
      render(conn, "show.json", edge: edge)
    end
  end

  def delete(conn, %{"id" => id}) do
    edge = Graph.get_edge!(id)

    with {:ok, %Edge{}} <- Graph.delete_edge(edge) do
      send_resp(conn, :no_content, "")
    end
  end
end
