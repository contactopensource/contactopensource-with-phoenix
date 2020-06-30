defmodule ContactWeb.TravelControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Concept

  @create_attrs %{created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], saga: "some saga", state_uri: "some state_uri", subtitle: "some subtitle", summary: "some summary", tenant_uri: "some tenant_uri", title: "some title", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
  @update_attrs %{created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], saga: "some updated saga", state_uri: "some updated state_uri", subtitle: "some updated subtitle", summary: "some updated summary", tenant_uri: "some updated tenant_uri", title: "some updated title", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
  @invalid_attrs %{created_at_clock_count: nil, created_at_timestamp_utc: nil, saga: nil, state_uri: nil, subtitle: nil, summary: nil, tenant_uri: nil, title: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

  def fixture(:travel) do
    {:ok, travel} = Concept.create_travel(@create_attrs)
    travel
  end

  describe "index" do
    test "lists all travels", %{conn: conn} do
      conn = get(conn, Routes.travel_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Travels"
    end
  end

  describe "new travel" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.travel_path(conn, :new))
      assert html_response(conn, 200) =~ "New Travel"
    end
  end

  describe "create travel" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.travel_path(conn, :create), travel: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.travel_path(conn, :show, id)

      conn = get(conn, Routes.travel_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Travel"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.travel_path(conn, :create), travel: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Travel"
    end
  end

  describe "edit travel" do
    setup [:create_travel]

    test "renders form for editing chosen travel", %{conn: conn, travel: travel} do
      conn = get(conn, Routes.travel_path(conn, :edit, travel))
      assert html_response(conn, 200) =~ "Edit Travel"
    end
  end

  describe "update travel" do
    setup [:create_travel]

    test "redirects when data is valid", %{conn: conn, travel: travel} do
      conn = put(conn, Routes.travel_path(conn, :update, travel), travel: @update_attrs)
      assert redirected_to(conn) == Routes.travel_path(conn, :show, travel)

      conn = get(conn, Routes.travel_path(conn, :show, travel))
      assert html_response(conn, 200) =~ "some updated saga"
    end

    test "renders errors when data is invalid", %{conn: conn, travel: travel} do
      conn = put(conn, Routes.travel_path(conn, :update, travel), travel: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Travel"
    end
  end

  describe "delete travel" do
    setup [:create_travel]

    test "deletes chosen travel", %{conn: conn, travel: travel} do
      conn = delete(conn, Routes.travel_path(conn, :delete, travel))
      assert redirected_to(conn) == Routes.travel_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.travel_path(conn, :show, travel))
      end
    end
  end

  defp create_travel(_) do
    travel = fixture(:travel)
    {:ok, travel: travel}
  end
end
