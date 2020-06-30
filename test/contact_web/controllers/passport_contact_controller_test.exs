defmodule ContactWeb.PassportContactControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Contactable

  @create_attrs %{country_text: "some country_text", created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], number_text: "some number_text", state_uri: "some state_uri", tenant_uri: "some tenant_uri", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri", valid_start_date: ~D[2010-04-17], valid_stop_date: ~D[2010-04-17]}
  @update_attrs %{country_text: "some updated country_text", created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], number_text: "some updated number_text", state_uri: "some updated state_uri", tenant_uri: "some updated tenant_uri", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri", valid_start_date: ~D[2011-05-18], valid_stop_date: ~D[2011-05-18]}
  @invalid_attrs %{country_text: nil, created_at_clock_count: nil, created_at_timestamp_utc: nil, number_text: nil, state_uri: nil, tenant_uri: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil, valid_start_date: nil, valid_stop_date: nil}

  def fixture(:passport_contact) do
    {:ok, passport_contact} = Contactable.create_passport_contact(@create_attrs)
    passport_contact
  end

  describe "index" do
    test "lists all passport_contacts", %{conn: conn} do
      conn = get(conn, Routes.passport_contact_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Passport contacts"
    end
  end

  describe "new passport_contact" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.passport_contact_path(conn, :new))
      assert html_response(conn, 200) =~ "New Passport contact"
    end
  end

  describe "create passport_contact" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.passport_contact_path(conn, :create), passport_contact: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.passport_contact_path(conn, :show, id)

      conn = get(conn, Routes.passport_contact_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Passport contact"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.passport_contact_path(conn, :create), passport_contact: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Passport contact"
    end
  end

  describe "edit passport_contact" do
    setup [:create_passport_contact]

    test "renders form for editing chosen passport_contact", %{conn: conn, passport_contact: passport_contact} do
      conn = get(conn, Routes.passport_contact_path(conn, :edit, passport_contact))
      assert html_response(conn, 200) =~ "Edit Passport contact"
    end
  end

  describe "update passport_contact" do
    setup [:create_passport_contact]

    test "redirects when data is valid", %{conn: conn, passport_contact: passport_contact} do
      conn = put(conn, Routes.passport_contact_path(conn, :update, passport_contact), passport_contact: @update_attrs)
      assert redirected_to(conn) == Routes.passport_contact_path(conn, :show, passport_contact)

      conn = get(conn, Routes.passport_contact_path(conn, :show, passport_contact))
      assert html_response(conn, 200) =~ "some updated country_text"
    end

    test "renders errors when data is invalid", %{conn: conn, passport_contact: passport_contact} do
      conn = put(conn, Routes.passport_contact_path(conn, :update, passport_contact), passport_contact: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Passport contact"
    end
  end

  describe "delete passport_contact" do
    setup [:create_passport_contact]

    test "deletes chosen passport_contact", %{conn: conn, passport_contact: passport_contact} do
      conn = delete(conn, Routes.passport_contact_path(conn, :delete, passport_contact))
      assert redirected_to(conn) == Routes.passport_contact_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.passport_contact_path(conn, :show, passport_contact))
      end
    end
  end

  defp create_passport_contact(_) do
    passport_contact = fixture(:passport_contact)
    {:ok, passport_contact: passport_contact}
  end
end
