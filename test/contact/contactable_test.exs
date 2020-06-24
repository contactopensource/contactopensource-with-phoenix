defmodule Contact.ContactableTest do
  use Contact.DataCase

  alias Contact.Contactable

  describe "link_contacts" do
    alias Contact.Contactable.LinkContact

    @valid_attrs %{label: "some label", state_text: "some state_text", state_uri: "some state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960662", type_text: "some type_text", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_text: "some updated_by_text", uri: "some uri"}
    @update_attrs %{label: "some updated label", state_text: "some updated state_text", state_uri: "some updated state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960668", type_text: "some updated type_text", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_text: "some updated updated_by_text", uri: "some updated uri"}
    @invalid_attrs %{label: nil, state_text: nil, state_uri: nil, tenant_id: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil, uri: nil}

    def link_contact_fixture(attrs \\ %{}) do
      {:ok, link_contact} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Contactable.create_link_contact()

      link_contact
    end

    test "list_link_contacts/0 returns all link_contacts" do
      link_contact = link_contact_fixture()
      assert Contactable.list_link_contacts() == [link_contact]
    end

    test "get_link_contact!/1 returns the link_contact with given id" do
      link_contact = link_contact_fixture()
      assert Contactable.get_link_contact!(link_contact.id) == link_contact
    end

    test "create_link_contact/1 with valid data creates a link_contact" do
      assert {:ok, %LinkContact{} = link_contact} = Contactable.create_link_contact(@valid_attrs)
      assert link_contact.label == "some label"
      assert link_contact.state_text == "some state_text"
      assert link_contact.state_uri == "some state_uri"
      assert link_contact.tenant_id == "7488a646-e31f-11e4-aace-600308960662"
      assert link_contact.type_text == "some type_text"
      assert link_contact.type_uri == "some type_uri"
      assert link_contact.updated_at_clock_count == 42
      assert link_contact.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert link_contact.updated_by_text == "some updated_by_text"
      assert link_contact.uri == "some uri"
    end

    test "create_link_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contactable.create_link_contact(@invalid_attrs)
    end

    test "update_link_contact/2 with valid data updates the link_contact" do
      link_contact = link_contact_fixture()
      assert {:ok, %LinkContact{} = link_contact} = Contactable.update_link_contact(link_contact, @update_attrs)
      assert link_contact.label == "some updated label"
      assert link_contact.state_text == "some updated state_text"
      assert link_contact.state_uri == "some updated state_uri"
      assert link_contact.tenant_id == "7488a646-e31f-11e4-aace-600308960668"
      assert link_contact.type_text == "some updated type_text"
      assert link_contact.type_uri == "some updated type_uri"
      assert link_contact.updated_at_clock_count == 43
      assert link_contact.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert link_contact.updated_by_text == "some updated updated_by_text"
      assert link_contact.uri == "some updated uri"
    end

    test "update_link_contact/2 with invalid data returns error changeset" do
      link_contact = link_contact_fixture()
      assert {:error, %Ecto.Changeset{}} = Contactable.update_link_contact(link_contact, @invalid_attrs)
      assert link_contact == Contactable.get_link_contact!(link_contact.id)
    end

    test "delete_link_contact/1 deletes the link_contact" do
      link_contact = link_contact_fixture()
      assert {:ok, %LinkContact{}} = Contactable.delete_link_contact(link_contact)
      assert_raise Ecto.NoResultsError, fn -> Contactable.get_link_contact!(link_contact.id) end
    end

    test "change_link_contact/1 returns a link_contact changeset" do
      link_contact = link_contact_fixture()
      assert %Ecto.Changeset{} = Contactable.change_link_contact(link_contact)
    end
  end
end
