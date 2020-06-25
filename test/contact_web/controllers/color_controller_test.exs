defmodule ContactWeb.ColorControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Qualia

  @create_attrs %{color_naming_system_name: "some color_naming_system_name", cymk_unit_interval_c: "120.5", cymk_unit_interval_k: "120.5", cymk_unit_interval_m: "120.5", cymk_unit_interval_y: "120.5", hex: "some hex", html_color_name: "some html_color_name", pantone_matching_system_name: "some pantone_matching_system_name", rgb_unit_interval_b: "120.5", rgb_unit_interval_g: "120.5", rgb_unit_interval_r: "120.5", state_uri: "some state_uri", tenant_uri: "some tenant_uri", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri", x11_color_name: "some x11_color_name"}
  @update_attrs %{color_naming_system_name: "some updated color_naming_system_name", cymk_unit_interval_c: "456.7", cymk_unit_interval_k: "456.7", cymk_unit_interval_m: "456.7", cymk_unit_interval_y: "456.7", hex: "some updated hex", html_color_name: "some updated html_color_name", pantone_matching_system_name: "some updated pantone_matching_system_name", rgb_unit_interval_b: "456.7", rgb_unit_interval_g: "456.7", rgb_unit_interval_r: "456.7", state_uri: "some updated state_uri", tenant_uri: "some updated tenant_uri", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri", x11_color_name: "some updated x11_color_name"}
  @invalid_attrs %{color_naming_system_name: nil, cymk_unit_interval_c: nil, cymk_unit_interval_k: nil, cymk_unit_interval_m: nil, cymk_unit_interval_y: nil, hex: nil, html_color_name: nil, pantone_matching_system_name: nil, rgb_unit_interval_b: nil, rgb_unit_interval_g: nil, rgb_unit_interval_r: nil, state_uri: nil, tenant_uri: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil, x11_color_name: nil}

  def fixture(:color) do
    {:ok, color} = Qualia.create_color(@create_attrs)
    color
  end

  describe "index" do
    test "lists all colors", %{conn: conn} do
      conn = get(conn, Routes.color_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Colors"
    end
  end

  describe "new color" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.color_path(conn, :new))
      assert html_response(conn, 200) =~ "New Color"
    end
  end

  describe "create color" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.color_path(conn, :create), color: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.color_path(conn, :show, id)

      conn = get(conn, Routes.color_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Color"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.color_path(conn, :create), color: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Color"
    end
  end

  describe "edit color" do
    setup [:create_color]

    test "renders form for editing chosen color", %{conn: conn, color: color} do
      conn = get(conn, Routes.color_path(conn, :edit, color))
      assert html_response(conn, 200) =~ "Edit Color"
    end
  end

  describe "update color" do
    setup [:create_color]

    test "redirects when data is valid", %{conn: conn, color: color} do
      conn = put(conn, Routes.color_path(conn, :update, color), color: @update_attrs)
      assert redirected_to(conn) == Routes.color_path(conn, :show, color)

      conn = get(conn, Routes.color_path(conn, :show, color))
      assert html_response(conn, 200) =~ "some updated color_naming_system_name"
    end

    test "renders errors when data is invalid", %{conn: conn, color: color} do
      conn = put(conn, Routes.color_path(conn, :update, color), color: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Color"
    end
  end

  describe "delete color" do
    setup [:create_color]

    test "deletes chosen color", %{conn: conn, color: color} do
      conn = delete(conn, Routes.color_path(conn, :delete, color))
      assert redirected_to(conn) == Routes.color_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.color_path(conn, :show, color))
      end
    end
  end

  defp create_color(_) do
    color = fixture(:color)
    {:ok, color: color}
  end
end
