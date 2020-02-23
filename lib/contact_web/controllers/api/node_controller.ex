defmodule ContactWeb.Api.NodeController do
  use ContactWeb, :controller

  alias Contact.Graph
  alias Contact.Graph.Node

  action_fallback ContactWeb.FallbackController

  def index(conn, _params) do
    nodes = Graph.list_nodes()
    render(conn, "index.json", nodes: nodes)
  end

  def create(conn, %{"node" => node_params}) do
    with {:ok, %Node{} = node} <- Graph.create_node(node_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_node_path(conn, :show, node))
      |> render("show.json", node: node)
    end
  end

  def show(conn, %{"id" => id}) do
    node = Graph.get_node!(id)
    render(conn, "show.json", node: node)
  end

  def update(conn, %{"id" => id, "node" => node_params}) do
    node = Graph.get_node!(id)

    with {:ok, %Node{} = node} <- Graph.update_node(node, node_params) do
      render(conn, "show.json", node: node)
    end
  end

  def delete(conn, %{"id" => id}) do
    node = Graph.get_node!(id)

    with {:ok, %Node{}} <- Graph.delete_node(node) do
      send_resp(conn, :no_content, "")
    end
  end
end
