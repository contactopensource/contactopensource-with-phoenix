defmodule ContactWeb.UriContactControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Contactable

  @create_attrs %{label: "some label", state_text: "some state_text", state_uri: "some state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960662", type_text: "some type_text", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_text: "some updated_by_text", uri: "some uri"}
  @update_attrs %{label: "some updated label", state_text: "some updated state_text", state_uri: "some updated state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960668", type_text: "some updated type_text", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_text: "some updated updated_by_text", uri: "some updated uri"}
  @invalid_attrs %{label: nil, state_text: nil, state_uri: nil, tenant_id: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil, uri: nil}

  def fixture(:uri_contact) do
    {:ok, uri_contact} = Contactable.create_uri_contact(@create_attrs)
    uri_contact
  end

  describe "index" do
    test "lists all uri_contacts", %{conn: conn} do
      conn = get(conn, Routes.uri_contact_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Link contacts"
    end
  end

  describe "new uri_contact" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.uri_contact_path(conn, :new))
      assert html_response(conn, 200) =~ "New Link contact"
    end
  end

  describe "create uri_contact" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.uri_contact_path(conn, :create), uri_contact: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.uri_contact_path(conn, :show, id)

      conn = get(conn, Routes.uri_contact_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Link contact"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.uri_contact_path(conn, :create), uri_contact: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Link contact"
    end
  end

  describe "edit uri_contact" do
    setup [:create_uri_contact]

    test "renders form for editing chosen uri_contact", %{conn: conn, uri_contact: uri_contact} do
      conn = get(conn, Routes.uri_contact_path(conn, :edit, uri_contact))
      assert html_response(conn, 200) =~ "Edit Link contact"
    end
  end

  describe "update uri_contact" do
    setup [:create_uri_contact]

    test "redirects when data is valid", %{conn: conn, uri_contact: uri_contact} do
      conn = put(conn, Routes.uri_contact_path(conn, :update, uri_contact), uri_contact: @update_attrs)
      assert redirected_to(conn) == Routes.uri_contact_path(conn, :show, uri_contact)

      conn = get(conn, Routes.uri_contact_path(conn, :show, uri_contact))
      assert html_response(conn, 200) =~ "some updated label"
    end

    test "renders errors when data is invalid", %{conn: conn, uri_contact: uri_contact} do
      conn = put(conn, Routes.uri_contact_path(conn, :update, uri_contact), uri_contact: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Link contact"
    end
  end

  describe "delete uri_contact" do
    setup [:create_uri_contact]

    test "deletes chosen uri_contact", %{conn: conn, uri_contact: uri_contact} do
      conn = delete(conn, Routes.uri_contact_path(conn, :delete, uri_contact))
      assert redirected_to(conn) == Routes.uri_contact_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.uri_contact_path(conn, :show, uri_contact))
      end
    end
  end

  defp create_uri_contact(_) do
    uri_contact = fixture(:uri_contact)
    {:ok, uri_contact: uri_contact}
  end
end
