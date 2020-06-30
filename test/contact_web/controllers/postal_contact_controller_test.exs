defmodule ContactWeb.PostalContactControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Contactable

  @create_attrs %{country_text: "some country_text", created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], freeform: "some freeform", global_location_number_text: "some global_location_number_text", locality_text: "some locality_text", neighborhood_text: "some neighborhood_text", postal_code_text: "some postal_code_text", premise_address_text: "some premise_address_text", region_text: "some region_text", state_uri: "some state_uri", street_address_text: "some street_address_text", tenant_uri: "some tenant_uri", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
  @update_attrs %{country_text: "some updated country_text", created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], freeform: "some updated freeform", global_location_number_text: "some updated global_location_number_text", locality_text: "some updated locality_text", neighborhood_text: "some updated neighborhood_text", postal_code_text: "some updated postal_code_text", premise_address_text: "some updated premise_address_text", region_text: "some updated region_text", state_uri: "some updated state_uri", street_address_text: "some updated street_address_text", tenant_uri: "some updated tenant_uri", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
  @invalid_attrs %{country_text: nil, created_at_clock_count: nil, created_at_timestamp_utc: nil, freeform: nil, global_location_number_text: nil, locality_text: nil, neighborhood_text: nil, postal_code_text: nil, premise_address_text: nil, region_text: nil, state_uri: nil, street_address_text: nil, tenant_uri: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

  def fixture(:postal_contact) do
    {:ok, postal_contact} = Contactable.create_postal_contact(@create_attrs)
    postal_contact
  end

  describe "index" do
    test "lists all postal_contacts", %{conn: conn} do
      conn = get(conn, Routes.postal_contact_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Postal contacts"
    end
  end

  describe "new postal_contact" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.postal_contact_path(conn, :new))
      assert html_response(conn, 200) =~ "New Postal contact"
    end
  end

  describe "create postal_contact" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.postal_contact_path(conn, :create), postal_contact: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.postal_contact_path(conn, :show, id)

      conn = get(conn, Routes.postal_contact_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Postal contact"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.postal_contact_path(conn, :create), postal_contact: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Postal contact"
    end
  end

  describe "edit postal_contact" do
    setup [:create_postal_contact]

    test "renders form for editing chosen postal_contact", %{conn: conn, postal_contact: postal_contact} do
      conn = get(conn, Routes.postal_contact_path(conn, :edit, postal_contact))
      assert html_response(conn, 200) =~ "Edit Postal contact"
    end
  end

  describe "update postal_contact" do
    setup [:create_postal_contact]

    test "redirects when data is valid", %{conn: conn, postal_contact: postal_contact} do
      conn = put(conn, Routes.postal_contact_path(conn, :update, postal_contact), postal_contact: @update_attrs)
      assert redirected_to(conn) == Routes.postal_contact_path(conn, :show, postal_contact)

      conn = get(conn, Routes.postal_contact_path(conn, :show, postal_contact))
      assert html_response(conn, 200) =~ "some updated country_text"
    end

    test "renders errors when data is invalid", %{conn: conn, postal_contact: postal_contact} do
      conn = put(conn, Routes.postal_contact_path(conn, :update, postal_contact), postal_contact: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Postal contact"
    end
  end

  describe "delete postal_contact" do
    setup [:create_postal_contact]

    test "deletes chosen postal_contact", %{conn: conn, postal_contact: postal_contact} do
      conn = delete(conn, Routes.postal_contact_path(conn, :delete, postal_contact))
      assert redirected_to(conn) == Routes.postal_contact_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.postal_contact_path(conn, :show, postal_contact))
      end
    end
  end

  defp create_postal_contact(_) do
    postal_contact = fixture(:postal_contact)
    {:ok, postal_contact: postal_contact}
  end
end
