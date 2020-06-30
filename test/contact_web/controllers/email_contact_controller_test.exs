defmodule ContactWeb.EmailContactControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Contactable

  @create_attrs %{addr_spec: "some addr_spec", address: "some address", created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], display_name: "some display_name", state_uri: "some state_uri", tenant_uri: "some tenant_uri", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
  @update_attrs %{addr_spec: "some updated addr_spec", address: "some updated address", created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], display_name: "some updated display_name", state_uri: "some updated state_uri", tenant_uri: "some updated tenant_uri", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
  @invalid_attrs %{addr_spec: nil, address: nil, created_at_clock_count: nil, created_at_timestamp_utc: nil, display_name: nil, state_uri: nil, tenant_uri: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

  def fixture(:email_contact) do
    {:ok, email_contact} = Contactable.create_email_contact(@create_attrs)
    email_contact
  end

  describe "index" do
    test "lists all email_contacts", %{conn: conn} do
      conn = get(conn, Routes.email_contact_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Email contacts"
    end
  end

  describe "new email_contact" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.email_contact_path(conn, :new))
      assert html_response(conn, 200) =~ "New Email contact"
    end
  end

  describe "create email_contact" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.email_contact_path(conn, :create), email_contact: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.email_contact_path(conn, :show, id)

      conn = get(conn, Routes.email_contact_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Email contact"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.email_contact_path(conn, :create), email_contact: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Email contact"
    end
  end

  describe "edit email_contact" do
    setup [:create_email_contact]

    test "renders form for editing chosen email_contact", %{conn: conn, email_contact: email_contact} do
      conn = get(conn, Routes.email_contact_path(conn, :edit, email_contact))
      assert html_response(conn, 200) =~ "Edit Email contact"
    end
  end

  describe "update email_contact" do
    setup [:create_email_contact]

    test "redirects when data is valid", %{conn: conn, email_contact: email_contact} do
      conn = put(conn, Routes.email_contact_path(conn, :update, email_contact), email_contact: @update_attrs)
      assert redirected_to(conn) == Routes.email_contact_path(conn, :show, email_contact)

      conn = get(conn, Routes.email_contact_path(conn, :show, email_contact))
      assert html_response(conn, 200) =~ "some updated addr_spec"
    end

    test "renders errors when data is invalid", %{conn: conn, email_contact: email_contact} do
      conn = put(conn, Routes.email_contact_path(conn, :update, email_contact), email_contact: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Email contact"
    end
  end

  describe "delete email_contact" do
    setup [:create_email_contact]

    test "deletes chosen email_contact", %{conn: conn, email_contact: email_contact} do
      conn = delete(conn, Routes.email_contact_path(conn, :delete, email_contact))
      assert redirected_to(conn) == Routes.email_contact_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.email_contact_path(conn, :show, email_contact))
      end
    end
  end

  defp create_email_contact(_) do
    email_contact = fixture(:email_contact)
    {:ok, email_contact: email_contact}
  end
end
