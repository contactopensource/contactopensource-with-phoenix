defmodule ContactWeb.LinkContactControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Contactable

  @create_attrs %{label: "some label", state_text: "some state_text", state_uri: "some state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960662", type_text: "some type_text", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_text: "some updated_by_text", uri: "some uri"}
  @update_attrs %{label: "some updated label", state_text: "some updated state_text", state_uri: "some updated state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960668", type_text: "some updated type_text", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_text: "some updated updated_by_text", uri: "some updated uri"}
  @invalid_attrs %{label: nil, state_text: nil, state_uri: nil, tenant_id: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil, uri: nil}

  def fixture(:link_contact) do
    {:ok, link_contact} = Contactable.create_link_contact(@create_attrs)
    link_contact
  end

  describe "index" do
    test "lists all link_contacts", %{conn: conn} do
      conn = get(conn, Routes.link_contact_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Link contacts"
    end
  end

  describe "new link_contact" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.link_contact_path(conn, :new))
      assert html_response(conn, 200) =~ "New Link contact"
    end
  end

  describe "create link_contact" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.link_contact_path(conn, :create), link_contact: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.link_contact_path(conn, :show, id)

      conn = get(conn, Routes.link_contact_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Link contact"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.link_contact_path(conn, :create), link_contact: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Link contact"
    end
  end

  describe "edit link_contact" do
    setup [:create_link_contact]

    test "renders form for editing chosen link_contact", %{conn: conn, link_contact: link_contact} do
      conn = get(conn, Routes.link_contact_path(conn, :edit, link_contact))
      assert html_response(conn, 200) =~ "Edit Link contact"
    end
  end

  describe "update link_contact" do
    setup [:create_link_contact]

    test "redirects when data is valid", %{conn: conn, link_contact: link_contact} do
      conn = put(conn, Routes.link_contact_path(conn, :update, link_contact), link_contact: @update_attrs)
      assert redirected_to(conn) == Routes.link_contact_path(conn, :show, link_contact)

      conn = get(conn, Routes.link_contact_path(conn, :show, link_contact))
      assert html_response(conn, 200) =~ "some updated label"
    end

    test "renders errors when data is invalid", %{conn: conn, link_contact: link_contact} do
      conn = put(conn, Routes.link_contact_path(conn, :update, link_contact), link_contact: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Link contact"
    end
  end

  describe "delete link_contact" do
    setup [:create_link_contact]

    test "deletes chosen link_contact", %{conn: conn, link_contact: link_contact} do
      conn = delete(conn, Routes.link_contact_path(conn, :delete, link_contact))
      assert redirected_to(conn) == Routes.link_contact_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.link_contact_path(conn, :show, link_contact))
      end
    end
  end

  defp create_link_contact(_) do
    link_contact = fixture(:link_contact)
    {:ok, link_contact: link_contact}
  end
end
