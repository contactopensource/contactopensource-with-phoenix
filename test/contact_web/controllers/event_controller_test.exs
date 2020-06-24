defmodule ContactWeb.EventControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Concept

  @create_attrs %{name: "some name", state_text: "some state_text", state_uri: "some state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960662", type_text: "some type_text", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_text: "some updated_by_text"}
  @update_attrs %{name: "some updated name", state_text: "some updated state_text", state_uri: "some updated state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960668", type_text: "some updated type_text", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_text: "some updated updated_by_text"}
  @invalid_attrs %{name: nil, state_text: nil, state_uri: nil, tenant_id: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil}

  def fixture(:event) do
    {:ok, event} = Concept.create_event(@create_attrs)
    event
  end

  describe "index" do
    test "lists all events", %{conn: conn} do
      conn = get(conn, Routes.event_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Events"
    end
  end

  describe "new event" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.event_path(conn, :new))
      assert html_response(conn, 200) =~ "New Event"
    end
  end

  describe "create event" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.event_path(conn, :create), event: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.event_path(conn, :show, id)

      conn = get(conn, Routes.event_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Event"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.event_path(conn, :create), event: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Event"
    end
  end

  describe "edit event" do
    setup [:create_event]

    test "renders form for editing chosen event", %{conn: conn, event: event} do
      conn = get(conn, Routes.event_path(conn, :edit, event))
      assert html_response(conn, 200) =~ "Edit Event"
    end
  end

  describe "update event" do
    setup [:create_event]

    test "redirects when data is valid", %{conn: conn, event: event} do
      conn = put(conn, Routes.event_path(conn, :update, event), event: @update_attrs)
      assert redirected_to(conn) == Routes.event_path(conn, :show, event)

      conn = get(conn, Routes.event_path(conn, :show, event))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, event: event} do
      conn = put(conn, Routes.event_path(conn, :update, event), event: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Event"
    end
  end

  describe "delete event" do
    setup [:create_event]

    test "deletes chosen event", %{conn: conn, event: event} do
      conn = delete(conn, Routes.event_path(conn, :delete, event))
      assert redirected_to(conn) == Routes.event_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.event_path(conn, :show, event))
      end
    end
  end

  defp create_event(_) do
    event = fixture(:event)
    {:ok, event: event}
  end
end
