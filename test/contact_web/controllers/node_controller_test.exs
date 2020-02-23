defmodule ContactWeb.NodeControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Graph

  @create_attrs %{json: %{}, number: "120.5", state_text: "some state_text", state_uri: "some state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960662", text: "some text", type_text: "some type_text", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_text: "some updated_by_text", xml: "some xml"}
  @update_attrs %{json: %{}, number: "456.7", state_text: "some updated state_text", state_uri: "some updated state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960668", text: "some updated text", type_text: "some updated type_text", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_text: "some updated updated_by_text", xml: "some updated xml"}
  @invalid_attrs %{json: nil, number: nil, state_text: nil, state_uri: nil, tenant_id: nil, text: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil, xml: nil}

  def fixture(:node) do
    {:ok, node} = Graph.create_node(@create_attrs)
    node
  end

  describe "index" do
    test "lists all nodes", %{conn: conn} do
      conn = get(conn, Routes.node_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Nodes"
    end
  end

  describe "new node" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.node_path(conn, :new))
      assert html_response(conn, 200) =~ "New Node"
    end
  end

  describe "create node" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.node_path(conn, :create), node: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.node_path(conn, :show, id)

      conn = get(conn, Routes.node_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Node"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.node_path(conn, :create), node: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Node"
    end
  end

  describe "edit node" do
    setup [:create_node]

    test "renders form for editing chosen node", %{conn: conn, node: node} do
      conn = get(conn, Routes.node_path(conn, :edit, node))
      assert html_response(conn, 200) =~ "Edit Node"
    end
  end

  describe "update node" do
    setup [:create_node]

    test "redirects when data is valid", %{conn: conn, node: node} do
      conn = put(conn, Routes.node_path(conn, :update, node), node: @update_attrs)
      assert redirected_to(conn) == Routes.node_path(conn, :show, node)

      conn = get(conn, Routes.node_path(conn, :show, node))
      assert html_response(conn, 200) =~ "some updated state_text"
    end

    test "renders errors when data is invalid", %{conn: conn, node: node} do
      conn = put(conn, Routes.node_path(conn, :update, node), node: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Node"
    end
  end

  describe "delete node" do
    setup [:create_node]

    test "deletes chosen node", %{conn: conn, node: node} do
      conn = delete(conn, Routes.node_path(conn, :delete, node))
      assert redirected_to(conn) == Routes.node_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.node_path(conn, :show, node))
      end
    end
  end

  defp create_node(_) do
    node = fixture(:node)
    {:ok, node: node}
  end
end
