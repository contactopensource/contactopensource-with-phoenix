defmodule ContactWeb.PhoneContactControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Contactable

  @create_attrs %{created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], e164_country_code: "some e164_country_code", e164_group_identification_code: "some e164_group_identification_code", e164_national_destination_code: "some e164_national_destination_code", e164_subscriber_number: "some e164_subscriber_number", e164_text: "some e164_text", e164_trial_identification_code: "some e164_trial_identification_code", label: "some label", number_text: "some number_text", state_uri: "some state_uri", tenant_uri: "some tenant_uri", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
  @update_attrs %{created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], e164_country_code: "some updated e164_country_code", e164_group_identification_code: "some updated e164_group_identification_code", e164_national_destination_code: "some updated e164_national_destination_code", e164_subscriber_number: "some updated e164_subscriber_number", e164_text: "some updated e164_text", e164_trial_identification_code: "some updated e164_trial_identification_code", label: "some updated label", number_text: "some updated number_text", state_uri: "some updated state_uri", tenant_uri: "some updated tenant_uri", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
  @invalid_attrs %{created_at_clock_count: nil, created_at_timestamp_utc: nil, e164_country_code: nil, e164_group_identification_code: nil, e164_national_destination_code: nil, e164_subscriber_number: nil, e164_text: nil, e164_trial_identification_code: nil, label: nil, number_text: nil, state_uri: nil, tenant_uri: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

  def fixture(:phone_contact) do
    {:ok, phone_contact} = Contactable.create_phone_contact(@create_attrs)
    phone_contact
  end

  describe "index" do
    test "lists all phone_contacts", %{conn: conn} do
      conn = get(conn, Routes.phone_contact_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Phone contacts"
    end
  end

  describe "new phone_contact" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.phone_contact_path(conn, :new))
      assert html_response(conn, 200) =~ "New Phone contact"
    end
  end

  describe "create phone_contact" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.phone_contact_path(conn, :create), phone_contact: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.phone_contact_path(conn, :show, id)

      conn = get(conn, Routes.phone_contact_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Phone contact"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.phone_contact_path(conn, :create), phone_contact: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Phone contact"
    end
  end

  describe "edit phone_contact" do
    setup [:create_phone_contact]

    test "renders form for editing chosen phone_contact", %{conn: conn, phone_contact: phone_contact} do
      conn = get(conn, Routes.phone_contact_path(conn, :edit, phone_contact))
      assert html_response(conn, 200) =~ "Edit Phone contact"
    end
  end

  describe "update phone_contact" do
    setup [:create_phone_contact]

    test "redirects when data is valid", %{conn: conn, phone_contact: phone_contact} do
      conn = put(conn, Routes.phone_contact_path(conn, :update, phone_contact), phone_contact: @update_attrs)
      assert redirected_to(conn) == Routes.phone_contact_path(conn, :show, phone_contact)

      conn = get(conn, Routes.phone_contact_path(conn, :show, phone_contact))
      assert html_response(conn, 200) =~ "some updated e164_country_code"
    end

    test "renders errors when data is invalid", %{conn: conn, phone_contact: phone_contact} do
      conn = put(conn, Routes.phone_contact_path(conn, :update, phone_contact), phone_contact: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Phone contact"
    end
  end

  describe "delete phone_contact" do
    setup [:create_phone_contact]

    test "deletes chosen phone_contact", %{conn: conn, phone_contact: phone_contact} do
      conn = delete(conn, Routes.phone_contact_path(conn, :delete, phone_contact))
      assert redirected_to(conn) == Routes.phone_contact_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.phone_contact_path(conn, :show, phone_contact))
      end
    end
  end

  defp create_phone_contact(_) do
    phone_contact = fixture(:phone_contact)
    {:ok, phone_contact: phone_contact}
  end
end
