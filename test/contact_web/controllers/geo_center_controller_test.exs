defmodule ContactWeb.GeoCenterControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Geo

  @create_attrs %{center_as_geo_point_id: "7488a646-e31f-11e4-aace-600308960662", created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], spread_as_meters: "120.5", state_uri: "some state_uri", tenant_uri: "some tenant_uri", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
  @update_attrs %{center_as_geo_point_id: "7488a646-e31f-11e4-aace-600308960668", created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], spread_as_meters: "456.7", state_uri: "some updated state_uri", tenant_uri: "some updated tenant_uri", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
  @invalid_attrs %{center_as_geo_point_id: nil, created_at_clock_count: nil, created_at_timestamp_utc: nil, spread_as_meters: nil, state_uri: nil, tenant_uri: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

  def fixture(:geo_center) do
    {:ok, geo_center} = Geo.create_geo_center(@create_attrs)
    geo_center
  end

  describe "index" do
    test "lists all geo_centers", %{conn: conn} do
      conn = get(conn, Routes.geo_center_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Geo centers"
    end
  end

  describe "new geo_center" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.geo_center_path(conn, :new))
      assert html_response(conn, 200) =~ "New Geo center"
    end
  end

  describe "create geo_center" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.geo_center_path(conn, :create), geo_center: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.geo_center_path(conn, :show, id)

      conn = get(conn, Routes.geo_center_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Geo center"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.geo_center_path(conn, :create), geo_center: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Geo center"
    end
  end

  describe "edit geo_center" do
    setup [:create_geo_center]

    test "renders form for editing chosen geo_center", %{conn: conn, geo_center: geo_center} do
      conn = get(conn, Routes.geo_center_path(conn, :edit, geo_center))
      assert html_response(conn, 200) =~ "Edit Geo center"
    end
  end

  describe "update geo_center" do
    setup [:create_geo_center]

    test "redirects when data is valid", %{conn: conn, geo_center: geo_center} do
      conn = put(conn, Routes.geo_center_path(conn, :update, geo_center), geo_center: @update_attrs)
      assert redirected_to(conn) == Routes.geo_center_path(conn, :show, geo_center)

      conn = get(conn, Routes.geo_center_path(conn, :show, geo_center))
      assert html_response(conn, 200) =~ "some updated state_uri"
    end

    test "renders errors when data is invalid", %{conn: conn, geo_center: geo_center} do
      conn = put(conn, Routes.geo_center_path(conn, :update, geo_center), geo_center: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Geo center"
    end
  end

  describe "delete geo_center" do
    setup [:create_geo_center]

    test "deletes chosen geo_center", %{conn: conn, geo_center: geo_center} do
      conn = delete(conn, Routes.geo_center_path(conn, :delete, geo_center))
      assert redirected_to(conn) == Routes.geo_center_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.geo_center_path(conn, :show, geo_center))
      end
    end
  end

  defp create_geo_center(_) do
    geo_center = fixture(:geo_center)
    {:ok, geo_center: geo_center}
  end
end
