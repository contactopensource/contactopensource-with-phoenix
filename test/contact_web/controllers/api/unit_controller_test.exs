defmodule ContactWeb.Api.UnitControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Data
  alias Contact.Data.Unit

  @create_attrs %{
    name: "some name",
    state_text: "some state_text",
    state_uri: "some state_uri",
    tenant_id: "7488a646-e31f-11e4-aace-600308960662",
    type_text: "some type_text",
    type_uri: "some type_uri",
    updated_at_clock_count: 42,
    updated_at_timestamp_utc: ~N[2010-04-17 14:00:00],
    updated_by_text: "some updated_by_text"
  }
  @update_attrs %{
    name: "some updated name",
    state_text: "some updated state_text",
    state_uri: "some updated state_uri",
    tenant_id: "7488a646-e31f-11e4-aace-600308960668",
    type_text: "some updated type_text",
    type_uri: "some updated type_uri",
    updated_at_clock_count: 43,
    updated_at_timestamp_utc: ~N[2011-05-18 15:01:01],
    updated_by_text: "some updated updated_by_text"
  }
  @invalid_attrs %{name: nil, state_text: nil, state_uri: nil, tenant_id: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil}

  def fixture(:unit) do
    {:ok, unit} = Data.create_unit(@create_attrs)
    unit
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all units", %{conn: conn} do
      conn = get(conn, Routes.api_unit_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create unit" do
    test "renders unit when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_unit_path(conn, :create), unit: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_unit_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name",
               "state_text" => "some state_text",
               "state_uri" => "some state_uri",
               "tenant_id" => "7488a646-e31f-11e4-aace-600308960662",
               "type_text" => "some type_text",
               "type_uri" => "some type_uri",
               "updated_at_clock_count" => 42,
               "updated_at_timestamp_utc" => "2010-04-17T14:00:00",
               "updated_by_text" => "some updated_by_text"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.api_unit_path(conn, :create), unit: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update unit" do
    setup [:create_unit]

    test "renders unit when data is valid", %{conn: conn, unit: %Unit{id: id} = unit} do
      conn = put(conn, Routes.api_unit_path(conn, :update, unit), unit: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_unit_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name",
               "state_text" => "some updated state_text",
               "state_uri" => "some updated state_uri",
               "tenant_id" => "7488a646-e31f-11e4-aace-600308960668",
               "type_text" => "some updated type_text",
               "type_uri" => "some updated type_uri",
               "updated_at_clock_count" => 43,
               "updated_at_timestamp_utc" => "2011-05-18T15:01:01",
               "updated_by_text" => "some updated updated_by_text"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, unit: unit} do
      conn = put(conn, Routes.api_unit_path(conn, :update, unit), unit: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete unit" do
    setup [:create_unit]

    test "deletes chosen unit", %{conn: conn, unit: unit} do
      conn = delete(conn, Routes.api_unit_path(conn, :delete, unit))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_unit_path(conn, :show, unit))
      end
    end
  end

  defp create_unit(_) do
    unit = fixture(:unit)
    {:ok, unit: unit}
  end
end
