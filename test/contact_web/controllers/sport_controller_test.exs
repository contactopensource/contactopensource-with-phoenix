defmodule ContactWeb.SportControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Concept

  @create_attrs %{created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], saga: "some saga", state_uri: "some state_uri", subtitle: "some subtitle", summary: "some summary", tenant_uri: "some tenant_uri", title: "some title", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
  @update_attrs %{created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], saga: "some updated saga", state_uri: "some updated state_uri", subtitle: "some updated subtitle", summary: "some updated summary", tenant_uri: "some updated tenant_uri", title: "some updated title", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
  @invalid_attrs %{created_at_clock_count: nil, created_at_timestamp_utc: nil, saga: nil, state_uri: nil, subtitle: nil, summary: nil, tenant_uri: nil, title: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

  def fixture(:sport) do
    {:ok, sport} = Concept.create_sport(@create_attrs)
    sport
  end

  describe "index" do
    test "lists all sports", %{conn: conn} do
      conn = get(conn, Routes.sport_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Sports"
    end
  end

  describe "new sport" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.sport_path(conn, :new))
      assert html_response(conn, 200) =~ "New Sport"
    end
  end

  describe "create sport" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sport_path(conn, :create), sport: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.sport_path(conn, :show, id)

      conn = get(conn, Routes.sport_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Sport"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sport_path(conn, :create), sport: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Sport"
    end
  end

  describe "edit sport" do
    setup [:create_sport]

    test "renders form for editing chosen sport", %{conn: conn, sport: sport} do
      conn = get(conn, Routes.sport_path(conn, :edit, sport))
      assert html_response(conn, 200) =~ "Edit Sport"
    end
  end

  describe "update sport" do
    setup [:create_sport]

    test "redirects when data is valid", %{conn: conn, sport: sport} do
      conn = put(conn, Routes.sport_path(conn, :update, sport), sport: @update_attrs)
      assert redirected_to(conn) == Routes.sport_path(conn, :show, sport)

      conn = get(conn, Routes.sport_path(conn, :show, sport))
      assert html_response(conn, 200) =~ "some updated saga"
    end

    test "renders errors when data is invalid", %{conn: conn, sport: sport} do
      conn = put(conn, Routes.sport_path(conn, :update, sport), sport: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Sport"
    end
  end

  describe "delete sport" do
    setup [:create_sport]

    test "deletes chosen sport", %{conn: conn, sport: sport} do
      conn = delete(conn, Routes.sport_path(conn, :delete, sport))
      assert redirected_to(conn) == Routes.sport_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.sport_path(conn, :show, sport))
      end
    end
  end

  defp create_sport(_) do
    sport = fixture(:sport)
    {:ok, sport: sport}
  end
end
