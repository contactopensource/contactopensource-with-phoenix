defmodule ContactWeb.Api.ColorControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Qualia
  alias Contact.Qualia.Color

  @create_attrs %{
    color_naming_system_name: "some color_naming_system_name",
    cymk_unit_interval_c: "120.5",
    cymk_unit_interval_k: "120.5",
    cymk_unit_interval_m: "120.5",
    cymk_unit_interval_y: "120.5",
    hex: "some hex",
    html_color_name: "some html_color_name",
    pantone_matching_system_name: "some pantone_matching_system_name",
    rgb_unit_interval_b: "120.5",
    rgb_unit_interval_g: "120.5",
    rgb_unit_interval_r: "120.5",
    state_uri: "some state_uri",
    tenant_uri: "some tenant_uri",
    type_uri: "some type_uri",
    updated_at_clock_count: 42,
    updated_at_timestamp_utc: ~N[2010-04-17 14:00:00],
    updated_by_uri: "some updated_by_uri",
    x11_color_name: "some x11_color_name"
  }
  @update_attrs %{
    color_naming_system_name: "some updated color_naming_system_name",
    cymk_unit_interval_c: "456.7",
    cymk_unit_interval_k: "456.7",
    cymk_unit_interval_m: "456.7",
    cymk_unit_interval_y: "456.7",
    hex: "some updated hex",
    html_color_name: "some updated html_color_name",
    pantone_matching_system_name: "some updated pantone_matching_system_name",
    rgb_unit_interval_b: "456.7",
    rgb_unit_interval_g: "456.7",
    rgb_unit_interval_r: "456.7",
    state_uri: "some updated state_uri",
    tenant_uri: "some updated tenant_uri",
    type_uri: "some updated type_uri",
    updated_at_clock_count: 43,
    updated_at_timestamp_utc: ~N[2011-05-18 15:01:01],
    updated_by_uri: "some updated updated_by_uri",
    x11_color_name: "some updated x11_color_name"
  }
  @invalid_attrs %{color_naming_system_name: nil, cymk_unit_interval_c: nil, cymk_unit_interval_k: nil, cymk_unit_interval_m: nil, cymk_unit_interval_y: nil, hex: nil, html_color_name: nil, pantone_matching_system_name: nil, rgb_unit_interval_b: nil, rgb_unit_interval_g: nil, rgb_unit_interval_r: nil, state_uri: nil, tenant_uri: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil, x11_color_name: nil}

  def fixture(:color) do
    {:ok, color} = Qualia.create_color(@create_attrs)
    color
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all colors", %{conn: conn} do
      conn = get(conn, Routes.api_color_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create color" do
    test "renders color when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_color_path(conn, :create), color: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_color_path(conn, :show, id))

      assert %{
               "id" => id,
               "color_naming_system_name" => "some color_naming_system_name",
               "cymk_unit_interval_c" => "120.5",
               "cymk_unit_interval_k" => "120.5",
               "cymk_unit_interval_m" => "120.5",
               "cymk_unit_interval_y" => "120.5",
               "hex" => "some hex",
               "html_color_name" => "some html_color_name",
               "pantone_matching_system_name" => "some pantone_matching_system_name",
               "rgb_unit_interval_b" => "120.5",
               "rgb_unit_interval_g" => "120.5",
               "rgb_unit_interval_r" => "120.5",
               "state_uri" => "some state_uri",
               "tenant_uri" => "some tenant_uri",
               "type_uri" => "some type_uri",
               "updated_at_clock_count" => 42,
               "updated_at_timestamp_utc" => "2010-04-17T14:00:00",
               "updated_by_uri" => "some updated_by_uri",
               "x11_color_name" => "some x11_color_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.api_color_path(conn, :create), color: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update color" do
    setup [:create_color]

    test "renders color when data is valid", %{conn: conn, color: %Color{id: id} = color} do
      conn = put(conn, Routes.api_color_path(conn, :update, color), color: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_color_path(conn, :show, id))

      assert %{
               "id" => id,
               "color_naming_system_name" => "some updated color_naming_system_name",
               "cymk_unit_interval_c" => "456.7",
               "cymk_unit_interval_k" => "456.7",
               "cymk_unit_interval_m" => "456.7",
               "cymk_unit_interval_y" => "456.7",
               "hex" => "some updated hex",
               "html_color_name" => "some updated html_color_name",
               "pantone_matching_system_name" => "some updated pantone_matching_system_name",
               "rgb_unit_interval_b" => "456.7",
               "rgb_unit_interval_g" => "456.7",
               "rgb_unit_interval_r" => "456.7",
               "state_uri" => "some updated state_uri",
               "tenant_uri" => "some updated tenant_uri",
               "type_uri" => "some updated type_uri",
               "updated_at_clock_count" => 43,
               "updated_at_timestamp_utc" => "2011-05-18T15:01:01",
               "updated_by_uri" => "some updated updated_by_uri",
               "x11_color_name" => "some updated x11_color_name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, color: color} do
      conn = put(conn, Routes.api_color_path(conn, :update, color), color: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete color" do
    setup [:create_color]

    test "deletes chosen color", %{conn: conn, color: color} do
      conn = delete(conn, Routes.api_color_path(conn, :delete, color))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_color_path(conn, :show, color))
      end
    end
  end

  defp create_color(_) do
    color = fixture(:color)
    {:ok, color: color}
  end
end
