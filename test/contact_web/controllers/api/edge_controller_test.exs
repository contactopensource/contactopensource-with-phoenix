defmodule ContactWeb.Api.EdgeControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Graph
  alias Contact.Graph.Edge

  @create_attrs %{
    count: 42,
    object_database: "some object_database",
    object_id: "7488a646-e31f-11e4-aace-600308960662",
    object_schema: "some object_schema",
    object_table: "some object_table",
    object_uri: "some object_uri",
    predicate_database: "some predicate_database",
    predicate_id: "7488a646-e31f-11e4-aace-600308960662",
    predicate_schema: "some predicate_schema",
    predicate_table: "some predicate_table",
    predicate_uri: "some predicate_uri",
    unit_interval: "120.5",
    dual_interval: "120.5",
    start_at_timestamp_utc: ~N[2010-04-17 14:00:00],
    state_text: "some state_text",
    state_uri: "some state_uri",
    stop_at_timestamp_utc: ~N[2010-04-17 14:00:00],
    subject_database: "some subject_database",
    subject_id: "7488a646-e31f-11e4-aace-600308960662",
    subject_schema: "some subject_schema",
    subject_table: "some subject_table",
    subject_uri: "some subject_uri",
    tenant_id: "7488a646-e31f-11e4-aace-600308960662",
    type_text: "some type_text",
    type_uri: "some type_uri",
    updated_at_clock_count: 42,
    updated_at_timestamp_utc: ~N[2010-04-17 14:00:00],
    updated_by_text: "some updated_by_text",
    weight: "120.5"
  }
  @update_attrs %{
    count: 43,
    object_database: "some updated object_database",
    object_id: "7488a646-e31f-11e4-aace-600308960668",
    object_schema: "some updated object_schema",
    object_table: "some updated object_table",
    object_uri: "some updated object_uri",
    predicate_database: "some updated predicate_database",
    predicate_id: "7488a646-e31f-11e4-aace-600308960668",
    predicate_schema: "some updated predicate_schema",
    predicate_table: "some updated predicate_table",
    predicate_uri: "some updated predicate_uri",
    unit_interval: "456.7",
    dual_interval: "456.7",
    start_at_timestamp_utc: ~N[2011-05-18 15:01:01],
    state_text: "some updated state_text",
    state_uri: "some updated state_uri",
    stop_at_timestamp_utc: ~N[2011-05-18 15:01:01],
    subject_database: "some updated subject_database",
    subject_id: "7488a646-e31f-11e4-aace-600308960668",
    subject_schema: "some updated subject_schema",
    subject_table: "some updated subject_table",
    subject_uri: "some updated subject_uri",
    tenant_id: "7488a646-e31f-11e4-aace-600308960668",
    type_text: "some updated type_text",
    type_uri: "some updated type_uri",
    updated_at_clock_count: 43,
    updated_at_timestamp_utc: ~N[2011-05-18 15:01:01],
    updated_by_text: "some updated updated_by_text",
    weight: "456.7"
  }
  @invalid_attrs %{count: nil, object_database: nil, object_id: nil, object_schema: nil, object_table: nil, object_uri: nil, predicate_database: nil, predicate_id: nil, predicate_schema: nil, predicate_table: nil, predicate_uri: nil, unit_interval: nil, dual_interval: nil, start_at_timestamp_utc: nil, state_text: nil, state_uri: nil, stop_at_timestamp_utc: nil, subject_database: nil, subject_id: nil, subject_schema: nil, subject_table: nil, subject_uri: nil, tenant_id: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil, weight: nil}

  def fixture(:edge) do
    {:ok, edge} = Graph.create_edge(@create_attrs)
    edge
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all edges", %{conn: conn} do
      conn = get(conn, Routes.api_edge_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create edge" do
    test "renders edge when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_edge_path(conn, :create), edge: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_edge_path(conn, :show, id))

      assert %{
               "id" => id,
               "count" => 42,
               "object_database" => "some object_database",
               "object_id" => "7488a646-e31f-11e4-aace-600308960662",
               "object_schema" => "some object_schema",
               "object_table" => "some object_table",
               "object_uri" => "some object_uri",
               "predicate_database" => "some predicate_database",
               "predicate_id" => "7488a646-e31f-11e4-aace-600308960662",
               "predicate_schema" => "some predicate_schema",
               "predicate_table" => "some predicate_table",
               "predicate_uri" => "some predicate_uri",
               "unit_interval" => "120.5",
               "dual_interval" => "120.5",
               "start_at_timestamp_utc" => "2010-04-17T14:00:00",
               "state_text" => "some state_text",
               "state_uri" => "some state_uri",
               "stop_at_timestamp_utc" => "2010-04-17T14:00:00",
               "subject_database" => "some subject_database",
               "subject_id" => "7488a646-e31f-11e4-aace-600308960662",
               "subject_schema" => "some subject_schema",
               "subject_table" => "some subject_table",
               "subject_uri" => "some subject_uri",
               "tenant_id" => "7488a646-e31f-11e4-aace-600308960662",
               "type_text" => "some type_text",
               "type_uri" => "some type_uri",
               "updated_at_clock_count" => 42,
               "updated_at_timestamp_utc" => "2010-04-17T14:00:00",
               "updated_by_text" => "some updated_by_text",
               "weight" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.api_edge_path(conn, :create), edge: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update edge" do
    setup [:create_edge]

    test "renders edge when data is valid", %{conn: conn, edge: %Edge{id: id} = edge} do
      conn = put(conn, Routes.api_edge_path(conn, :update, edge), edge: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_edge_path(conn, :show, id))

      assert %{
               "id" => id,
               "count" => 43,
               "object_database" => "some updated object_database",
               "object_id" => "7488a646-e31f-11e4-aace-600308960668",
               "object_schema" => "some updated object_schema",
               "object_table" => "some updated object_table",
               "object_uri" => "some updated object_uri",
               "predicate_database" => "some updated predicate_database",
               "predicate_id" => "7488a646-e31f-11e4-aace-600308960668",
               "predicate_schema" => "some updated predicate_schema",
               "predicate_table" => "some updated predicate_table",
               "predicate_uri" => "some updated predicate_uri",
               "unit_interval" => "456.7",
               "dual_interval" => "456.7",
               "start_at_timestamp_utc" => "2011-05-18T15:01:01",
               "state_text" => "some updated state_text",
               "state_uri" => "some updated state_uri",
               "stop_at_timestamp_utc" => "2011-05-18T15:01:01",
               "subject_database" => "some updated subject_database",
               "subject_id" => "7488a646-e31f-11e4-aace-600308960668",
               "subject_schema" => "some updated subject_schema",
               "subject_table" => "some updated subject_table",
               "subject_uri" => "some updated subject_uri",
               "tenant_id" => "7488a646-e31f-11e4-aace-600308960668",
               "type_text" => "some updated type_text",
               "type_uri" => "some updated type_uri",
               "updated_at_clock_count" => 43,
               "updated_at_timestamp_utc" => "2011-05-18T15:01:01",
               "updated_by_text" => "some updated updated_by_text",
               "weight" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, edge: edge} do
      conn = put(conn, Routes.api_edge_path(conn, :update, edge), edge: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete edge" do
    setup [:create_edge]

    test "deletes chosen edge", %{conn: conn, edge: edge} do
      conn = delete(conn, Routes.api_edge_path(conn, :delete, edge))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_edge_path(conn, :show, edge))
      end
    end
  end

  defp create_edge(_) do
    edge = fixture(:edge)
    {:ok, edge: edge}
  end
end
