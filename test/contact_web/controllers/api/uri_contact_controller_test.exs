defmodule ContactWeb.Api.UriContactControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Contactable
  alias Contact.Contactable.UriContact

  @create_attrs %{
    label: "some label",
    state_text: "some state_text",
    state_uri: "some state_uri",
    tenant_id: "7488a646-e31f-11e4-aace-600308960662",
    type_text: "some type_text",
    type_uri: "some type_uri",
    updated_at_clock_count: 42,
    updated_at_timestamp_utc: ~N[2010-04-17 14:00:00],
    updated_by_text: "some updated_by_text",
    uri: "some uri"
  }
  @update_attrs %{
    label: "some updated label",
    state_text: "some updated state_text",
    state_uri: "some updated state_uri",
    tenant_id: "7488a646-e31f-11e4-aace-600308960668",
    type_text: "some updated type_text",
    type_uri: "some updated type_uri",
    updated_at_clock_count: 43,
    updated_at_timestamp_utc: ~N[2011-05-18 15:01:01],
    updated_by_text: "some updated updated_by_text",
    uri: "some updated uri"
  }
  @invalid_attrs %{label: nil, state_text: nil, state_uri: nil, tenant_id: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil, uri: nil}

  def fixture(:uri_contact) do
    {:ok, uri_contact} = Contactable.create_uri_contact(@create_attrs)
    uri_contact
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all uri_contacts", %{conn: conn} do
      conn = get(conn, Routes.api_uri_contact_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create uri_contact" do
    test "renders uri_contact when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_uri_contact_path(conn, :create), uri_contact: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_uri_contact_path(conn, :show, id))

      assert %{
               "id" => id,
               "label" => "some label",
               "state_text" => "some state_text",
               "state_uri" => "some state_uri",
               "tenant_id" => "7488a646-e31f-11e4-aace-600308960662",
               "type_text" => "some type_text",
               "type_uri" => "some type_uri",
               "updated_at_clock_count" => 42,
               "updated_at_timestamp_utc" => "2010-04-17T14:00:00",
               "updated_by_text" => "some updated_by_text",
               "uri" => "some uri"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.api_uri_contact_path(conn, :create), uri_contact: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update uri_contact" do
    setup [:create_uri_contact]

    test "renders uri_contact when data is valid", %{conn: conn, uri_contact: %UriContact{id: id} = uri_contact} do
      conn = put(conn, Routes.api_uri_contact_path(conn, :update, uri_contact), uri_contact: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_uri_contact_path(conn, :show, id))

      assert %{
               "id" => id,
               "label" => "some updated label",
               "state_text" => "some updated state_text",
               "state_uri" => "some updated state_uri",
               "tenant_id" => "7488a646-e31f-11e4-aace-600308960668",
               "type_text" => "some updated type_text",
               "type_uri" => "some updated type_uri",
               "updated_at_clock_count" => 43,
               "updated_at_timestamp_utc" => "2011-05-18T15:01:01",
               "updated_by_text" => "some updated updated_by_text",
               "uri" => "some updated uri"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, uri_contact: uri_contact} do
      conn = put(conn, Routes.api_uri_contact_path(conn, :update, uri_contact), uri_contact: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete uri_contact" do
    setup [:create_uri_contact]

    test "deletes chosen uri_contact", %{conn: conn, uri_contact: uri_contact} do
      conn = delete(conn, Routes.api_uri_contact_path(conn, :delete, uri_contact))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_uri_contact_path(conn, :show, uri_contact))
      end
    end
  end

  defp create_uri_contact(_) do
    uri_contact = fixture(:uri_contact)
    {:ok, uri_contact: uri_contact}
  end
end
