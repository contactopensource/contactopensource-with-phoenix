defmodule Contact.ContactableTest do
  use Contact.DataCase

  alias Contact.Contactable

  describe "uri_contacts" do
    alias Contact.Contactable.UriContact

    @valid_attrs %{label: "some label", state_text: "some state_text", state_uri: "some state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960662", type_text: "some type_text", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_text: "some updated_by_text", uri: "some uri"}
    @update_attrs %{label: "some updated label", state_text: "some updated state_text", state_uri: "some updated state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960668", type_text: "some updated type_text", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_text: "some updated updated_by_text", uri: "some updated uri"}
    @invalid_attrs %{label: nil, state_text: nil, state_uri: nil, tenant_id: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil, uri: nil}

    def uri_contact_fixture(attrs \\ %{}) do
      {:ok, uri_contact} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Contactable.create_uri_contact()

      uri_contact
    end

    test "list_uri_contacts/0 returns all uri_contacts" do
      uri_contact = uri_contact_fixture()
      assert Contactable.list_uri_contacts() == [uri_contact]
    end

    test "get_uri_contact!/1 returns the uri_contact with given id" do
      uri_contact = uri_contact_fixture()
      assert Contactable.get_uri_contact!(uri_contact.id) == uri_contact
    end

    test "create_uri_contact/1 with valid data creates a uri_contact" do
      assert {:ok, %UriContact{} = uri_contact} = Contactable.create_uri_contact(@valid_attrs)
      assert uri_contact.label == "some label"
      assert uri_contact.state_text == "some state_text"
      assert uri_contact.state_uri == "some state_uri"
      assert uri_contact.tenant_id == "7488a646-e31f-11e4-aace-600308960662"
      assert uri_contact.type_text == "some type_text"
      assert uri_contact.type_uri == "some type_uri"
      assert uri_contact.updated_at_clock_count == 42
      assert uri_contact.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert uri_contact.updated_by_text == "some updated_by_text"
      assert uri_contact.uri == "some uri"
    end

    test "create_uri_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contactable.create_uri_contact(@invalid_attrs)
    end

    test "update_uri_contact/2 with valid data updates the uri_contact" do
      uri_contact = uri_contact_fixture()
      assert {:ok, %UriContact{} = uri_contact} = Contactable.update_uri_contact(uri_contact, @update_attrs)
      assert uri_contact.label == "some updated label"
      assert uri_contact.state_text == "some updated state_text"
      assert uri_contact.state_uri == "some updated state_uri"
      assert uri_contact.tenant_id == "7488a646-e31f-11e4-aace-600308960668"
      assert uri_contact.type_text == "some updated type_text"
      assert uri_contact.type_uri == "some updated type_uri"
      assert uri_contact.updated_at_clock_count == 43
      assert uri_contact.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert uri_contact.updated_by_text == "some updated updated_by_text"
      assert uri_contact.uri == "some updated uri"
    end

    test "update_uri_contact/2 with invalid data returns error changeset" do
      uri_contact = uri_contact_fixture()
      assert {:error, %Ecto.Changeset{}} = Contactable.update_uri_contact(uri_contact, @invalid_attrs)
      assert uri_contact == Contactable.get_uri_contact!(uri_contact.id)
    end

    test "delete_uri_contact/1 deletes the uri_contact" do
      uri_contact = uri_contact_fixture()
      assert {:ok, %UriContact{}} = Contactable.delete_uri_contact(uri_contact)
      assert_raise Ecto.NoResultsError, fn -> Contactable.get_uri_contact!(uri_contact.id) end
    end

    test "change_uri_contact/1 returns a uri_contact changeset" do
      uri_contact = uri_contact_fixture()
      assert %Ecto.Changeset{} = Contactable.change_uri_contact(uri_contact)
    end
  end

  describe "email_contacts" do
    alias Contact.Contactable.EmailContact

    @valid_attrs %{addr_spec: "some addr_spec", address: "some address", created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], display_name: "some display_name", state_uri: "some state_uri", tenant_uri: "some tenant_uri", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
    @update_attrs %{addr_spec: "some updated addr_spec", address: "some updated address", created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], display_name: "some updated display_name", state_uri: "some updated state_uri", tenant_uri: "some updated tenant_uri", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
    @invalid_attrs %{addr_spec: nil, address: nil, created_at_clock_count: nil, created_at_timestamp_utc: nil, display_name: nil, state_uri: nil, tenant_uri: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

    def email_contact_fixture(attrs \\ %{}) do
      {:ok, email_contact} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Contactable.create_email_contact()

      email_contact
    end

    test "list_email_contacts/0 returns all email_contacts" do
      email_contact = email_contact_fixture()
      assert Contactable.list_email_contacts() == [email_contact]
    end

    test "get_email_contact!/1 returns the email_contact with given id" do
      email_contact = email_contact_fixture()
      assert Contactable.get_email_contact!(email_contact.id) == email_contact
    end

    test "create_email_contact/1 with valid data creates a email_contact" do
      assert {:ok, %EmailContact{} = email_contact} = Contactable.create_email_contact(@valid_attrs)
      assert email_contact.addr_spec == "some addr_spec"
      assert email_contact.address == "some address"
      assert email_contact.created_at_clock_count == 42
      assert email_contact.created_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert email_contact.display_name == "some display_name"
      assert email_contact.state_uri == "some state_uri"
      assert email_contact.tenant_uri == "some tenant_uri"
      assert email_contact.type_uri == "some type_uri"
      assert email_contact.updated_at_clock_count == 42
      assert email_contact.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert email_contact.updated_by_uri == "some updated_by_uri"
    end

    test "create_email_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contactable.create_email_contact(@invalid_attrs)
    end

    test "update_email_contact/2 with valid data updates the email_contact" do
      email_contact = email_contact_fixture()
      assert {:ok, %EmailContact{} = email_contact} = Contactable.update_email_contact(email_contact, @update_attrs)
      assert email_contact.addr_spec == "some updated addr_spec"
      assert email_contact.address == "some updated address"
      assert email_contact.created_at_clock_count == 43
      assert email_contact.created_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert email_contact.display_name == "some updated display_name"
      assert email_contact.state_uri == "some updated state_uri"
      assert email_contact.tenant_uri == "some updated tenant_uri"
      assert email_contact.type_uri == "some updated type_uri"
      assert email_contact.updated_at_clock_count == 43
      assert email_contact.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert email_contact.updated_by_uri == "some updated updated_by_uri"
    end

    test "update_email_contact/2 with invalid data returns error changeset" do
      email_contact = email_contact_fixture()
      assert {:error, %Ecto.Changeset{}} = Contactable.update_email_contact(email_contact, @invalid_attrs)
      assert email_contact == Contactable.get_email_contact!(email_contact.id)
    end

    test "delete_email_contact/1 deletes the email_contact" do
      email_contact = email_contact_fixture()
      assert {:ok, %EmailContact{}} = Contactable.delete_email_contact(email_contact)
      assert_raise Ecto.NoResultsError, fn -> Contactable.get_email_contact!(email_contact.id) end
    end

    test "change_email_contact/1 returns a email_contact changeset" do
      email_contact = email_contact_fixture()
      assert %Ecto.Changeset{} = Contactable.change_email_contact(email_contact)
    end
  end

  describe "phone_contacts" do
    alias Contact.Contactable.PhoneContact

    @valid_attrs %{created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], e164_country_code: "some e164_country_code", e164_group_identification_code: "some e164_group_identification_code", e164_national_destination_code: "some e164_national_destination_code", e164_subscriber_number: "some e164_subscriber_number", e164_text: "some e164_text", e164_trial_identification_code: "some e164_trial_identification_code", label: "some label", number_text: "some number_text", state_uri: "some state_uri", tenant_uri: "some tenant_uri", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
    @update_attrs %{created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], e164_country_code: "some updated e164_country_code", e164_group_identification_code: "some updated e164_group_identification_code", e164_national_destination_code: "some updated e164_national_destination_code", e164_subscriber_number: "some updated e164_subscriber_number", e164_text: "some updated e164_text", e164_trial_identification_code: "some updated e164_trial_identification_code", label: "some updated label", number_text: "some updated number_text", state_uri: "some updated state_uri", tenant_uri: "some updated tenant_uri", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
    @invalid_attrs %{created_at_clock_count: nil, created_at_timestamp_utc: nil, e164_country_code: nil, e164_group_identification_code: nil, e164_national_destination_code: nil, e164_subscriber_number: nil, e164_text: nil, e164_trial_identification_code: nil, label: nil, number_text: nil, state_uri: nil, tenant_uri: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

    def phone_contact_fixture(attrs \\ %{}) do
      {:ok, phone_contact} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Contactable.create_phone_contact()

      phone_contact
    end

    test "list_phone_contacts/0 returns all phone_contacts" do
      phone_contact = phone_contact_fixture()
      assert Contactable.list_phone_contacts() == [phone_contact]
    end

    test "get_phone_contact!/1 returns the phone_contact with given id" do
      phone_contact = phone_contact_fixture()
      assert Contactable.get_phone_contact!(phone_contact.id) == phone_contact
    end

    test "create_phone_contact/1 with valid data creates a phone_contact" do
      assert {:ok, %PhoneContact{} = phone_contact} = Contactable.create_phone_contact(@valid_attrs)
      assert phone_contact.created_at_clock_count == 42
      assert phone_contact.created_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert phone_contact.e164_country_code == "some e164_country_code"
      assert phone_contact.e164_group_identification_code == "some e164_group_identification_code"
      assert phone_contact.e164_national_destination_code == "some e164_national_destination_code"
      assert phone_contact.e164_subscriber_number == "some e164_subscriber_number"
      assert phone_contact.e164_text == "some e164_text"
      assert phone_contact.e164_trial_identification_code == "some e164_trial_identification_code"
      assert phone_contact.label == "some label"
      assert phone_contact.number_text == "some number_text"
      assert phone_contact.state_uri == "some state_uri"
      assert phone_contact.tenant_uri == "some tenant_uri"
      assert phone_contact.type_uri == "some type_uri"
      assert phone_contact.updated_at_clock_count == 42
      assert phone_contact.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert phone_contact.updated_by_uri == "some updated_by_uri"
    end

    test "create_phone_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contactable.create_phone_contact(@invalid_attrs)
    end

    test "update_phone_contact/2 with valid data updates the phone_contact" do
      phone_contact = phone_contact_fixture()
      assert {:ok, %PhoneContact{} = phone_contact} = Contactable.update_phone_contact(phone_contact, @update_attrs)
      assert phone_contact.created_at_clock_count == 43
      assert phone_contact.created_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert phone_contact.e164_country_code == "some updated e164_country_code"
      assert phone_contact.e164_group_identification_code == "some updated e164_group_identification_code"
      assert phone_contact.e164_national_destination_code == "some updated e164_national_destination_code"
      assert phone_contact.e164_subscriber_number == "some updated e164_subscriber_number"
      assert phone_contact.e164_text == "some updated e164_text"
      assert phone_contact.e164_trial_identification_code == "some updated e164_trial_identification_code"
      assert phone_contact.label == "some updated label"
      assert phone_contact.number_text == "some updated number_text"
      assert phone_contact.state_uri == "some updated state_uri"
      assert phone_contact.tenant_uri == "some updated tenant_uri"
      assert phone_contact.type_uri == "some updated type_uri"
      assert phone_contact.updated_at_clock_count == 43
      assert phone_contact.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert phone_contact.updated_by_uri == "some updated updated_by_uri"
    end

    test "update_phone_contact/2 with invalid data returns error changeset" do
      phone_contact = phone_contact_fixture()
      assert {:error, %Ecto.Changeset{}} = Contactable.update_phone_contact(phone_contact, @invalid_attrs)
      assert phone_contact == Contactable.get_phone_contact!(phone_contact.id)
    end

    test "delete_phone_contact/1 deletes the phone_contact" do
      phone_contact = phone_contact_fixture()
      assert {:ok, %PhoneContact{}} = Contactable.delete_phone_contact(phone_contact)
      assert_raise Ecto.NoResultsError, fn -> Contactable.get_phone_contact!(phone_contact.id) end
    end

    test "change_phone_contact/1 returns a phone_contact changeset" do
      phone_contact = phone_contact_fixture()
      assert %Ecto.Changeset{} = Contactable.change_phone_contact(phone_contact)
    end
  end

  describe "postal_contacts" do
    alias Contact.Contactable.PostalContact

    @valid_attrs %{country_text: "some country_text", created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], freeform: "some freeform", global_location_number_text: "some global_location_number_text", locality_text: "some locality_text", neighborhood_text: "some neighborhood_text", postal_code_text: "some postal_code_text", premise_address_text: "some premise_address_text", region_text: "some region_text", state_uri: "some state_uri", street_address_text: "some street_address_text", tenant_uri: "some tenant_uri", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
    @update_attrs %{country_text: "some updated country_text", created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], freeform: "some updated freeform", global_location_number_text: "some updated global_location_number_text", locality_text: "some updated locality_text", neighborhood_text: "some updated neighborhood_text", postal_code_text: "some updated postal_code_text", premise_address_text: "some updated premise_address_text", region_text: "some updated region_text", state_uri: "some updated state_uri", street_address_text: "some updated street_address_text", tenant_uri: "some updated tenant_uri", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
    @invalid_attrs %{country_text: nil, created_at_clock_count: nil, created_at_timestamp_utc: nil, freeform: nil, global_location_number_text: nil, locality_text: nil, neighborhood_text: nil, postal_code_text: nil, premise_address_text: nil, region_text: nil, state_uri: nil, street_address_text: nil, tenant_uri: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

    def postal_contact_fixture(attrs \\ %{}) do
      {:ok, postal_contact} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Contactable.create_postal_contact()

      postal_contact
    end

    test "list_postal_contacts/0 returns all postal_contacts" do
      postal_contact = postal_contact_fixture()
      assert Contactable.list_postal_contacts() == [postal_contact]
    end

    test "get_postal_contact!/1 returns the postal_contact with given id" do
      postal_contact = postal_contact_fixture()
      assert Contactable.get_postal_contact!(postal_contact.id) == postal_contact
    end

    test "create_postal_contact/1 with valid data creates a postal_contact" do
      assert {:ok, %PostalContact{} = postal_contact} = Contactable.create_postal_contact(@valid_attrs)
      assert postal_contact.country_text == "some country_text"
      assert postal_contact.created_at_clock_count == 42
      assert postal_contact.created_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert postal_contact.freeform == "some freeform"
      assert postal_contact.global_location_number_text == "some global_location_number_text"
      assert postal_contact.locality_text == "some locality_text"
      assert postal_contact.neighborhood_text == "some neighborhood_text"
      assert postal_contact.postal_code_text == "some postal_code_text"
      assert postal_contact.premise_address_text == "some premise_address_text"
      assert postal_contact.region_text == "some region_text"
      assert postal_contact.state_uri == "some state_uri"
      assert postal_contact.street_address_text == "some street_address_text"
      assert postal_contact.tenant_uri == "some tenant_uri"
      assert postal_contact.type_uri == "some type_uri"
      assert postal_contact.updated_at_clock_count == 42
      assert postal_contact.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert postal_contact.updated_by_uri == "some updated_by_uri"
    end

    test "create_postal_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contactable.create_postal_contact(@invalid_attrs)
    end

    test "update_postal_contact/2 with valid data updates the postal_contact" do
      postal_contact = postal_contact_fixture()
      assert {:ok, %PostalContact{} = postal_contact} = Contactable.update_postal_contact(postal_contact, @update_attrs)
      assert postal_contact.country_text == "some updated country_text"
      assert postal_contact.created_at_clock_count == 43
      assert postal_contact.created_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert postal_contact.freeform == "some updated freeform"
      assert postal_contact.global_location_number_text == "some updated global_location_number_text"
      assert postal_contact.locality_text == "some updated locality_text"
      assert postal_contact.neighborhood_text == "some updated neighborhood_text"
      assert postal_contact.postal_code_text == "some updated postal_code_text"
      assert postal_contact.premise_address_text == "some updated premise_address_text"
      assert postal_contact.region_text == "some updated region_text"
      assert postal_contact.state_uri == "some updated state_uri"
      assert postal_contact.street_address_text == "some updated street_address_text"
      assert postal_contact.tenant_uri == "some updated tenant_uri"
      assert postal_contact.type_uri == "some updated type_uri"
      assert postal_contact.updated_at_clock_count == 43
      assert postal_contact.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert postal_contact.updated_by_uri == "some updated updated_by_uri"
    end

    test "update_postal_contact/2 with invalid data returns error changeset" do
      postal_contact = postal_contact_fixture()
      assert {:error, %Ecto.Changeset{}} = Contactable.update_postal_contact(postal_contact, @invalid_attrs)
      assert postal_contact == Contactable.get_postal_contact!(postal_contact.id)
    end

    test "delete_postal_contact/1 deletes the postal_contact" do
      postal_contact = postal_contact_fixture()
      assert {:ok, %PostalContact{}} = Contactable.delete_postal_contact(postal_contact)
      assert_raise Ecto.NoResultsError, fn -> Contactable.get_postal_contact!(postal_contact.id) end
    end

    test "change_postal_contact/1 returns a postal_contact changeset" do
      postal_contact = postal_contact_fixture()
      assert %Ecto.Changeset{} = Contactable.change_postal_contact(postal_contact)
    end
  end

  describe "passport_contacts" do
    alias Contact.Contactable.PassportContact

    @valid_attrs %{country_text: "some country_text", created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], number_text: "some number_text", state_uri: "some state_uri", tenant_uri: "some tenant_uri", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri", valid_start_date: ~D[2010-04-17], valid_stop_date: ~D[2010-04-17]}
    @update_attrs %{country_text: "some updated country_text", created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], number_text: "some updated number_text", state_uri: "some updated state_uri", tenant_uri: "some updated tenant_uri", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri", valid_start_date: ~D[2011-05-18], valid_stop_date: ~D[2011-05-18]}
    @invalid_attrs %{country_text: nil, created_at_clock_count: nil, created_at_timestamp_utc: nil, number_text: nil, state_uri: nil, tenant_uri: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil, valid_start_date: nil, valid_stop_date: nil}

    def passport_contact_fixture(attrs \\ %{}) do
      {:ok, passport_contact} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Contactable.create_passport_contact()

      passport_contact
    end

    test "list_passport_contacts/0 returns all passport_contacts" do
      passport_contact = passport_contact_fixture()
      assert Contactable.list_passport_contacts() == [passport_contact]
    end

    test "get_passport_contact!/1 returns the passport_contact with given id" do
      passport_contact = passport_contact_fixture()
      assert Contactable.get_passport_contact!(passport_contact.id) == passport_contact
    end

    test "create_passport_contact/1 with valid data creates a passport_contact" do
      assert {:ok, %PassportContact{} = passport_contact} = Contactable.create_passport_contact(@valid_attrs)
      assert passport_contact.country_text == "some country_text"
      assert passport_contact.created_at_clock_count == 42
      assert passport_contact.created_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert passport_contact.number_text == "some number_text"
      assert passport_contact.state_uri == "some state_uri"
      assert passport_contact.tenant_uri == "some tenant_uri"
      assert passport_contact.type_uri == "some type_uri"
      assert passport_contact.updated_at_clock_count == 42
      assert passport_contact.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert passport_contact.updated_by_uri == "some updated_by_uri"
      assert passport_contact.valid_start_date == ~D[2010-04-17]
      assert passport_contact.valid_stop_date == ~D[2010-04-17]
    end

    test "create_passport_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contactable.create_passport_contact(@invalid_attrs)
    end

    test "update_passport_contact/2 with valid data updates the passport_contact" do
      passport_contact = passport_contact_fixture()
      assert {:ok, %PassportContact{} = passport_contact} = Contactable.update_passport_contact(passport_contact, @update_attrs)
      assert passport_contact.country_text == "some updated country_text"
      assert passport_contact.created_at_clock_count == 43
      assert passport_contact.created_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert passport_contact.number_text == "some updated number_text"
      assert passport_contact.state_uri == "some updated state_uri"
      assert passport_contact.tenant_uri == "some updated tenant_uri"
      assert passport_contact.type_uri == "some updated type_uri"
      assert passport_contact.updated_at_clock_count == 43
      assert passport_contact.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert passport_contact.updated_by_uri == "some updated updated_by_uri"
      assert passport_contact.valid_start_date == ~D[2011-05-18]
      assert passport_contact.valid_stop_date == ~D[2011-05-18]
    end

    test "update_passport_contact/2 with invalid data returns error changeset" do
      passport_contact = passport_contact_fixture()
      assert {:error, %Ecto.Changeset{}} = Contactable.update_passport_contact(passport_contact, @invalid_attrs)
      assert passport_contact == Contactable.get_passport_contact!(passport_contact.id)
    end

    test "delete_passport_contact/1 deletes the passport_contact" do
      passport_contact = passport_contact_fixture()
      assert {:ok, %PassportContact{}} = Contactable.delete_passport_contact(passport_contact)
      assert_raise Ecto.NoResultsError, fn -> Contactable.get_passport_contact!(passport_contact.id) end
    end

    test "change_passport_contact/1 returns a passport_contact changeset" do
      passport_contact = passport_contact_fixture()
      assert %Ecto.Changeset{} = Contactable.change_passport_contact(passport_contact)
    end
  end
end
