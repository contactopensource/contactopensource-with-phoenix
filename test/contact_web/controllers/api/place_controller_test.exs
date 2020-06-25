defmodule ContactWeb.Api.PlaceControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Concept
  alias Contact.Concept.Place

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

  def fixture(:place) do
    {:ok, place} = Concept.create_place(@create_attrs)
    place
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all places", %{conn: conn} do
      conn = get(conn, Routes.api_place_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create place" do
    test "renders place when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_place_path(conn, :create), place: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_place_path(conn, :show, id))

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
      conn = post(conn, Routes.api_place_path(conn, :create), place: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update place" do
    setup [:create_place]

    test "renders place when data is valid", %{conn: conn, place: %Place{id: id} = place} do
      conn = put(conn, Routes.api_place_path(conn, :update, place), place: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_place_path(conn, :show, id))

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

    test "renders errors when data is invalid", %{conn: conn, place: place} do
      conn = put(conn, Routes.api_place_path(conn, :update, place), place: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete place" do
    setup [:create_place]

    test "deletes chosen place", %{conn: conn, place: place} do
      conn = delete(conn, Routes.api_place_path(conn, :delete, place))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_place_path(conn, :show, place))
      end
    end
  end

  defp create_place(_) do
    place = fixture(:place)
    {:ok, place: place}
  end
end