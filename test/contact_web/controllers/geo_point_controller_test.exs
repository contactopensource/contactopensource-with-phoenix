defmodule ContactWeb.GeoPointControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Geo

  @create_attrs %{altitude_agl_as_meters: "120.5", altitude_msl_as_meters: "120.5", created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], elevation_agl_as_meters: "120.5", elevation_msl_as_meters: "120.5", latitude_as_decimal_degrees: "120.5", longitude_as_decimal_degrees: "120.5", state_uri: "some state_uri", tenant_uri: "some tenant_uri", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
  @update_attrs %{altitude_agl_as_meters: "456.7", altitude_msl_as_meters: "456.7", created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], elevation_agl_as_meters: "456.7", elevation_msl_as_meters: "456.7", latitude_as_decimal_degrees: "456.7", longitude_as_decimal_degrees: "456.7", state_uri: "some updated state_uri", tenant_uri: "some updated tenant_uri", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
  @invalid_attrs %{altitude_agl_as_meters: nil, altitude_msl_as_meters: nil, created_at_clock_count: nil, created_at_timestamp_utc: nil, elevation_agl_as_meters: nil, elevation_msl_as_meters: nil, latitude_as_decimal_degrees: nil, longitude_as_decimal_degrees: nil, state_uri: nil, tenant_uri: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

  def fixture(:geo_point) do
    {:ok, geo_point} = Geo.create_geo_point(@create_attrs)
    geo_point
  end

  describe "index" do
    test "lists all geo_points", %{conn: conn} do
      conn = get(conn, Routes.geo_point_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Geo points"
    end
  end

  describe "new geo_point" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.geo_point_path(conn, :new))
      assert html_response(conn, 200) =~ "New Geo point"
    end
  end

  describe "create geo_point" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.geo_point_path(conn, :create), geo_point: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.geo_point_path(conn, :show, id)

      conn = get(conn, Routes.geo_point_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Geo point"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.geo_point_path(conn, :create), geo_point: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Geo point"
    end
  end

  describe "edit geo_point" do
    setup [:create_geo_point]

    test "renders form for editing chosen geo_point", %{conn: conn, geo_point: geo_point} do
      conn = get(conn, Routes.geo_point_path(conn, :edit, geo_point))
      assert html_response(conn, 200) =~ "Edit Geo point"
    end
  end

  describe "update geo_point" do
    setup [:create_geo_point]

    test "redirects when data is valid", %{conn: conn, geo_point: geo_point} do
      conn = put(conn, Routes.geo_point_path(conn, :update, geo_point), geo_point: @update_attrs)
      assert redirected_to(conn) == Routes.geo_point_path(conn, :show, geo_point)

      conn = get(conn, Routes.geo_point_path(conn, :show, geo_point))
      assert html_response(conn, 200) =~ "some updated state_uri"
    end

    test "renders errors when data is invalid", %{conn: conn, geo_point: geo_point} do
      conn = put(conn, Routes.geo_point_path(conn, :update, geo_point), geo_point: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Geo point"
    end
  end

  describe "delete geo_point" do
    setup [:create_geo_point]

    test "deletes chosen geo_point", %{conn: conn, geo_point: geo_point} do
      conn = delete(conn, Routes.geo_point_path(conn, :delete, geo_point))
      assert redirected_to(conn) == Routes.geo_point_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.geo_point_path(conn, :show, geo_point))
      end
    end
  end

  defp create_geo_point(_) do
    geo_point = fixture(:geo_point)
    {:ok, geo_point: geo_point}
  end
end
