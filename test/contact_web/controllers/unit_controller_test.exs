defmodule ContactWeb.UnitControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Data

  @create_attrs %{name: "some name", state_text: "some state_text", state_uri: "some state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960662", type_text: "some type_text", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_text: "some updated_by_text"}
  @update_attrs %{name: "some updated name", state_text: "some updated state_text", state_uri: "some updated state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960668", type_text: "some updated type_text", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_text: "some updated updated_by_text"}
  @invalid_attrs %{name: nil, state_text: nil, state_uri: nil, tenant_id: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil}

  def fixture(:unit) do
    {:ok, unit} = Data.create_unit(@create_attrs)
    unit
  end

  describe "index" do
    test "lists all units", %{conn: conn} do
      conn = get(conn, Routes.unit_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Units"
    end
  end

  describe "new unit" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.unit_path(conn, :new))
      assert html_response(conn, 200) =~ "New Unit"
    end
  end

  describe "create unit" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.unit_path(conn, :create), unit: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.unit_path(conn, :show, id)

      conn = get(conn, Routes.unit_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Unit"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.unit_path(conn, :create), unit: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Unit"
    end
  end

  describe "edit unit" do
    setup [:create_unit]

    test "renders form for editing chosen unit", %{conn: conn, unit: unit} do
      conn = get(conn, Routes.unit_path(conn, :edit, unit))
      assert html_response(conn, 200) =~ "Edit Unit"
    end
  end

  describe "update unit" do
    setup [:create_unit]

    test "redirects when data is valid", %{conn: conn, unit: unit} do
      conn = put(conn, Routes.unit_path(conn, :update, unit), unit: @update_attrs)
      assert redirected_to(conn) == Routes.unit_path(conn, :show, unit)

      conn = get(conn, Routes.unit_path(conn, :show, unit))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, unit: unit} do
      conn = put(conn, Routes.unit_path(conn, :update, unit), unit: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Unit"
    end
  end

  describe "delete unit" do
    setup [:create_unit]

    test "deletes chosen unit", %{conn: conn, unit: unit} do
      conn = delete(conn, Routes.unit_path(conn, :delete, unit))
      assert redirected_to(conn) == Routes.unit_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.unit_path(conn, :show, unit))
      end
    end
  end

  defp create_unit(_) do
    unit = fixture(:unit)
    {:ok, unit: unit}
  end
end
