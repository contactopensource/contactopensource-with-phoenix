defmodule ContactWeb.Api.PersonControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Concept
  alias Contact.Concept.Person

  @create_attrs %{
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
    state_text: "some updated state_text",
    state_uri: "some updated state_uri",
    tenant_id: "7488a646-e31f-11e4-aace-600308960668",
    type_text: "some updated type_text",
    type_uri: "some updated type_uri",
    updated_at_clock_count: 43,
    updated_at_timestamp_utc: ~N[2011-05-18 15:01:01],
    updated_by_text: "some updated updated_by_text"
  }
  @invalid_attrs %{state_text: nil, state_uri: nil, tenant_id: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil}

  def fixture(:person) do
    {:ok, person} = Concept.create_person(@create_attrs)
    person
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all persons", %{conn: conn} do
      conn = get(conn, Routes.api_person_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create person" do
    test "renders person when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_person_path(conn, :create), person: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_person_path(conn, :show, id))

      assert %{
               "id" => id,
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
      conn = post(conn, Routes.api_person_path(conn, :create), person: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update person" do
    setup [:create_person]

    test "renders person when data is valid", %{conn: conn, person: %Person{id: id} = person} do
      conn = put(conn, Routes.api_person_path(conn, :update, person), person: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_person_path(conn, :show, id))

      assert %{
               "id" => id,
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

    test "renders errors when data is invalid", %{conn: conn, person: person} do
      conn = put(conn, Routes.api_person_path(conn, :update, person), person: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete person" do
    setup [:create_person]

    test "deletes chosen person", %{conn: conn, person: person} do
      conn = delete(conn, Routes.api_person_path(conn, :delete, person))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_person_path(conn, :show, person))
      end
    end
  end

  defp create_person(_) do
    person = fixture(:person)
    {:ok, person: person}
  end
end
