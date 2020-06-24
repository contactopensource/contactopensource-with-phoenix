defmodule ContactWeb.PlaceControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Concept

  @create_attrs %{name: "some name", state_text: "some state_text", state_uri: "some state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960662", type_text: "some type_text", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_text: "some updated_by_text"}
  @update_attrs %{name: "some updated name", state_text: "some updated state_text", state_uri: "some updated state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960668", type_text: "some updated type_text", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_text: "some updated updated_by_text"}
  @invalid_attrs %{name: nil, state_text: nil, state_uri: nil, tenant_id: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil}

  def fixture(:place) do
    {:ok, place} = Concept.create_place(@create_attrs)
    place
  end

  describe "index" do
    test "lists all places", %{conn: conn} do
      conn = get(conn, Routes.place_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Places"
    end
  end

  describe "new place" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.place_path(conn, :new))
      assert html_response(conn, 200) =~ "New Place"
    end
  end

  describe "create place" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.place_path(conn, :create), place: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.place_path(conn, :show, id)

      conn = get(conn, Routes.place_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Place"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.place_path(conn, :create), place: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Place"
    end
  end

  describe "edit place" do
    setup [:create_place]

    test "renders form for editing chosen place", %{conn: conn, place: place} do
      conn = get(conn, Routes.place_path(conn, :edit, place))
      assert html_response(conn, 200) =~ "Edit Place"
    end
  end

  describe "update place" do
    setup [:create_place]

    test "redirects when data is valid", %{conn: conn, place: place} do
      conn = put(conn, Routes.place_path(conn, :update, place), place: @update_attrs)
      assert redirected_to(conn) == Routes.place_path(conn, :show, place)

      conn = get(conn, Routes.place_path(conn, :show, place))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, place: place} do
      conn = put(conn, Routes.place_path(conn, :update, place), place: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Place"
    end
  end

  describe "delete place" do
    setup [:create_place]

    test "deletes chosen place", %{conn: conn, place: place} do
      conn = delete(conn, Routes.place_path(conn, :delete, place))
      assert redirected_to(conn) == Routes.place_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.place_path(conn, :show, place))
      end
    end
  end

  defp create_place(_) do
    place = fixture(:place)
    {:ok, place: place}
  end
end
