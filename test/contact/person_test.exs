defmodule Contact.PersonTest do
  use Contact.DataCase

  alias Contact.Person

  describe "person_pronoun_kits" do
    alias Contact.Person.PersonPronounKit

    @valid_attrs %{created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], dependent_possessive_pronoun: "some dependent_possessive_pronoun", disjunctive_pronoun: "some disjunctive_pronoun", independent_possessive_pronoun: "some independent_possessive_pronoun", intensive_pronoun: "some intensive_pronoun", object_pronoun: "some object_pronoun", reflexive_pronoun: "some reflexive_pronoun", state_uri: "some state_uri", subject_pronoun: "some subject_pronoun", tenant_uri: "some tenant_uri", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
    @update_attrs %{created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], dependent_possessive_pronoun: "some updated dependent_possessive_pronoun", disjunctive_pronoun: "some updated disjunctive_pronoun", independent_possessive_pronoun: "some updated independent_possessive_pronoun", intensive_pronoun: "some updated intensive_pronoun", object_pronoun: "some updated object_pronoun", reflexive_pronoun: "some updated reflexive_pronoun", state_uri: "some updated state_uri", subject_pronoun: "some updated subject_pronoun", tenant_uri: "some updated tenant_uri", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
    @invalid_attrs %{created_at_clock_count: nil, created_at_timestamp_utc: nil, dependent_possessive_pronoun: nil, disjunctive_pronoun: nil, independent_possessive_pronoun: nil, intensive_pronoun: nil, object_pronoun: nil, reflexive_pronoun: nil, state_uri: nil, subject_pronoun: nil, tenant_uri: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

    def person_pronoun_kit_fixture(attrs \\ %{}) do
      {:ok, person_pronoun_kit} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Person.create_person_pronoun_kit()

      person_pronoun_kit
    end

    test "list_person_pronoun_kits/0 returns all person_pronoun_kits" do
      person_pronoun_kit = person_pronoun_kit_fixture()
      assert Person.list_person_pronoun_kits() == [person_pronoun_kit]
    end

    test "get_person_pronoun_kit!/1 returns the person_pronoun_kit with given id" do
      person_pronoun_kit = person_pronoun_kit_fixture()
      assert Person.get_person_pronoun_kit!(person_pronoun_kit.id) == person_pronoun_kit
    end

    test "create_person_pronoun_kit/1 with valid data creates a person_pronoun_kit" do
      assert {:ok, %PersonPronounKit{} = person_pronoun_kit} = Person.create_person_pronoun_kit(@valid_attrs)
      assert person_pronoun_kit.created_at_clock_count == 42
      assert person_pronoun_kit.created_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert person_pronoun_kit.dependent_possessive_pronoun == "some dependent_possessive_pronoun"
      assert person_pronoun_kit.disjunctive_pronoun == "some disjunctive_pronoun"
      assert person_pronoun_kit.independent_possessive_pronoun == "some independent_possessive_pronoun"
      assert person_pronoun_kit.intensive_pronoun == "some intensive_pronoun"
      assert person_pronoun_kit.object_pronoun == "some object_pronoun"
      assert person_pronoun_kit.reflexive_pronoun == "some reflexive_pronoun"
      assert person_pronoun_kit.state_uri == "some state_uri"
      assert person_pronoun_kit.subject_pronoun == "some subject_pronoun"
      assert person_pronoun_kit.tenant_uri == "some tenant_uri"
      assert person_pronoun_kit.type_uri == "some type_uri"
      assert person_pronoun_kit.updated_at_clock_count == 42
      assert person_pronoun_kit.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert person_pronoun_kit.updated_by_uri == "some updated_by_uri"
    end

    test "create_person_pronoun_kit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Person.create_person_pronoun_kit(@invalid_attrs)
    end

    test "update_person_pronoun_kit/2 with valid data updates the person_pronoun_kit" do
      person_pronoun_kit = person_pronoun_kit_fixture()
      assert {:ok, %PersonPronounKit{} = person_pronoun_kit} = Person.update_person_pronoun_kit(person_pronoun_kit, @update_attrs)
      assert person_pronoun_kit.created_at_clock_count == 43
      assert person_pronoun_kit.created_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert person_pronoun_kit.dependent_possessive_pronoun == "some updated dependent_possessive_pronoun"
      assert person_pronoun_kit.disjunctive_pronoun == "some updated disjunctive_pronoun"
      assert person_pronoun_kit.independent_possessive_pronoun == "some updated independent_possessive_pronoun"
      assert person_pronoun_kit.intensive_pronoun == "some updated intensive_pronoun"
      assert person_pronoun_kit.object_pronoun == "some updated object_pronoun"
      assert person_pronoun_kit.reflexive_pronoun == "some updated reflexive_pronoun"
      assert person_pronoun_kit.state_uri == "some updated state_uri"
      assert person_pronoun_kit.subject_pronoun == "some updated subject_pronoun"
      assert person_pronoun_kit.tenant_uri == "some updated tenant_uri"
      assert person_pronoun_kit.type_uri == "some updated type_uri"
      assert person_pronoun_kit.updated_at_clock_count == 43
      assert person_pronoun_kit.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert person_pronoun_kit.updated_by_uri == "some updated updated_by_uri"
    end

    test "update_person_pronoun_kit/2 with invalid data returns error changeset" do
      person_pronoun_kit = person_pronoun_kit_fixture()
      assert {:error, %Ecto.Changeset{}} = Person.update_person_pronoun_kit(person_pronoun_kit, @invalid_attrs)
      assert person_pronoun_kit == Person.get_person_pronoun_kit!(person_pronoun_kit.id)
    end

    test "delete_person_pronoun_kit/1 deletes the person_pronoun_kit" do
      person_pronoun_kit = person_pronoun_kit_fixture()
      assert {:ok, %PersonPronounKit{}} = Person.delete_person_pronoun_kit(person_pronoun_kit)
      assert_raise Ecto.NoResultsError, fn -> Person.get_person_pronoun_kit!(person_pronoun_kit.id) end
    end

    test "change_person_pronoun_kit/1 returns a person_pronoun_kit changeset" do
      person_pronoun_kit = person_pronoun_kit_fixture()
      assert %Ecto.Changeset{} = Person.change_person_pronoun_kit(person_pronoun_kit)
    end
  end
end
