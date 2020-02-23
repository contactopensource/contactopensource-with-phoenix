defmodule ContactWeb.Api.NodeControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Graph
  alias Contact.Graph.Node

  @create_attrs %{
    json: %{},
    number: "120.5",
    state_text: "some state_text",
    state_uri: "some state_uri",
    tenant_id: "7488a646-e31f-11e4-aace-600308960662",
    text: "some text",
    type_text: "some type_text",
    type_uri: "some type_uri",
    updated_at_clock_count: 42,
    updated_at_timestamp_utc: ~N[2010-04-17 14:00:00],
    updated_by_text: "some updated_by_text",
    xml: "some xml"
  }
  @update_attrs %{
    json: %{},
    number: "456.7",
    state_text: "some updated state_text",
    state_uri: "some updated state_uri",
    tenant_id: "7488a646-e31f-11e4-aace-600308960668",
    text: "some updated text",
    type_text: "some updated type_text",
    type_uri: "some updated type_uri",
    updated_at_clock_count: 43,
    updated_at_timestamp_utc: ~N[2011-05-18 15:01:01],
    updated_by_text: "some updated updated_by_text",
    xml: "some updated xml"
  }
  @invalid_attrs %{json: nil, number: nil, state_text: nil, state_uri: nil, tenant_id: nil, text: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil, xml: nil}

  def fixture(:node) do
    {:ok, node} = Graph.create_node(@create_attrs)
    node
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all nodes", %{conn: conn} do
      conn = get(conn, Routes.api_node_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create node" do
    test "renders node when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_node_path(conn, :create), node: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_node_path(conn, :show, id))

      assert %{
               "id" => id,
               "json" => %{},
               "number" => "120.5",
               "state_text" => "some state_text",
               "state_uri" => "some state_uri",
               "tenant_id" => "7488a646-e31f-11e4-aace-600308960662",
               "text" => "some text",
               "type_text" => "some type_text",
               "type_uri" => "some type_uri",
               "updated_at_clock_count" => 42,
               "updated_at_timestamp_utc" => "2010-04-17T14:00:00",
               "updated_by_text" => "some updated_by_text",
               "xml" => "some xml"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.api_node_path(conn, :create), node: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update node" do
    setup [:create_node]

    test "renders node when data is valid", %{conn: conn, node: %Node{id: id} = node} do
      conn = put(conn, Routes.api_node_path(conn, :update, node), node: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_node_path(conn, :show, id))

      assert %{
               "id" => id,
               "json" => {},
               "number" => "456.7",
               "state_text" => "some updated state_text",
               "state_uri" => "some updated state_uri",
               "tenant_id" => "7488a646-e31f-11e4-aace-600308960668",
               "text" => "some updated text",
               "type_text" => "some updated type_text",
               "type_uri" => "some updated type_uri",
               "updated_at_clock_count" => 43,
               "updated_at_timestamp_utc" => "2011-05-18T15:01:01",
               "updated_by_text" => "some updated updated_by_text",
               "xml" => "some updated xml"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, node: node} do
      conn = put(conn, Routes.api_node_path(conn, :update, node), node: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete node" do
    setup [:create_node]

    test "deletes chosen node", %{conn: conn, node: node} do
      conn = delete(conn, Routes.api_node_path(conn, :delete, node))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_node_path(conn, :show, node))
      end
    end
  end

  defp create_node(_) do
    node = fixture(:node)
    {:ok, node: node}
  end
end
