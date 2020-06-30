defmodule Contact.ConceptTest do
  use Contact.DataCase

  alias Contact.Concept

  describe "persons" do
    alias Contact.Concept.Person

    @valid_attrs %{state_text: "some state_text", state_uri: "some state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960662", type_text: "some type_text", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_text: "some updated_by_text"}
    @update_attrs %{state_text: "some updated state_text", state_uri: "some updated state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960668", type_text: "some updated type_text", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_text: "some updated updated_by_text"}
    @invalid_attrs %{state_text: nil, state_uri: nil, tenant_id: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil}

    def person_fixture(attrs \\ %{}) do
      {:ok, person} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Concept.create_person()

      person
    end

    test "list_persons/0 returns all persons" do
      person = person_fixture()
      assert Concept.list_persons() == [person]
    end

    test "get_person!/1 returns the person with given id" do
      person = person_fixture()
      assert Concept.get_person!(person.id) == person
    end

    test "create_person/1 with valid data creates a person" do
      assert {:ok, %Person{} = person} = Concept.create_person(@valid_attrs)
      assert person.state_text == "some state_text"
      assert person.state_uri == "some state_uri"
      assert person.tenant_id == "7488a646-e31f-11e4-aace-600308960662"
      assert person.type_text == "some type_text"
      assert person.type_uri == "some type_uri"
      assert person.updated_at_clock_count == 42
      assert person.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert person.updated_by_text == "some updated_by_text"
    end

    test "create_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Concept.create_person(@invalid_attrs)
    end

    test "update_person/2 with valid data updates the person" do
      person = person_fixture()
      assert {:ok, %Person{} = person} = Concept.update_person(person, @update_attrs)
      assert person.state_text == "some updated state_text"
      assert person.state_uri == "some updated state_uri"
      assert person.tenant_id == "7488a646-e31f-11e4-aace-600308960668"
      assert person.type_text == "some updated type_text"
      assert person.type_uri == "some updated type_uri"
      assert person.updated_at_clock_count == 43
      assert person.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert person.updated_by_text == "some updated updated_by_text"
    end

    test "update_person/2 with invalid data returns error changeset" do
      person = person_fixture()
      assert {:error, %Ecto.Changeset{}} = Concept.update_person(person, @invalid_attrs)
      assert person == Concept.get_person!(person.id)
    end

    test "delete_person/1 deletes the person" do
      person = person_fixture()
      assert {:ok, %Person{}} = Concept.delete_person(person)
      assert_raise Ecto.NoResultsError, fn -> Concept.get_person!(person.id) end
    end

    test "change_person/1 returns a person changeset" do
      person = person_fixture()
      assert %Ecto.Changeset{} = Concept.change_person(person)
    end
  end

  describe "places" do
    alias Contact.Concept.Place

    @valid_attrs %{name: "some name", state_text: "some state_text", state_uri: "some state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960662", type_text: "some type_text", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_text: "some updated_by_text"}
    @update_attrs %{name: "some updated name", state_text: "some updated state_text", state_uri: "some updated state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960668", type_text: "some updated type_text", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_text: "some updated updated_by_text"}
    @invalid_attrs %{name: nil, state_text: nil, state_uri: nil, tenant_id: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil}

    def place_fixture(attrs \\ %{}) do
      {:ok, place} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Concept.create_place()

      place
    end

    test "list_places/0 returns all places" do
      place = place_fixture()
      assert Concept.list_places() == [place]
    end

    test "get_place!/1 returns the place with given id" do
      place = place_fixture()
      assert Concept.get_place!(place.id) == place
    end

    test "create_place/1 with valid data creates a place" do
      assert {:ok, %Place{} = place} = Concept.create_place(@valid_attrs)
      assert place.name == "some name"
      assert place.state_text == "some state_text"
      assert place.state_uri == "some state_uri"
      assert place.tenant_id == "7488a646-e31f-11e4-aace-600308960662"
      assert place.type_text == "some type_text"
      assert place.type_uri == "some type_uri"
      assert place.updated_at_clock_count == 42
      assert place.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert place.updated_by_text == "some updated_by_text"
    end

    test "create_place/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Concept.create_place(@invalid_attrs)
    end

    test "update_place/2 with valid data updates the place" do
      place = place_fixture()
      assert {:ok, %Place{} = place} = Concept.update_place(place, @update_attrs)
      assert place.name == "some updated name"
      assert place.state_text == "some updated state_text"
      assert place.state_uri == "some updated state_uri"
      assert place.tenant_id == "7488a646-e31f-11e4-aace-600308960668"
      assert place.type_text == "some updated type_text"
      assert place.type_uri == "some updated type_uri"
      assert place.updated_at_clock_count == 43
      assert place.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert place.updated_by_text == "some updated updated_by_text"
    end

    test "update_place/2 with invalid data returns error changeset" do
      place = place_fixture()
      assert {:error, %Ecto.Changeset{}} = Concept.update_place(place, @invalid_attrs)
      assert place == Concept.get_place!(place.id)
    end

    test "delete_place/1 deletes the place" do
      place = place_fixture()
      assert {:ok, %Place{}} = Concept.delete_place(place)
      assert_raise Ecto.NoResultsError, fn -> Concept.get_place!(place.id) end
    end

    test "change_place/1 returns a place changeset" do
      place = place_fixture()
      assert %Ecto.Changeset{} = Concept.change_place(place)
    end
  end

  describe "things" do
    alias Contact.Concept.Thing

    @valid_attrs %{name: "some name", state_text: "some state_text", state_uri: "some state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960662", type_text: "some type_text", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_text: "some updated_by_text"}
    @update_attrs %{name: "some updated name", state_text: "some updated state_text", state_uri: "some updated state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960668", type_text: "some updated type_text", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_text: "some updated updated_by_text"}
    @invalid_attrs %{name: nil, state_text: nil, state_uri: nil, tenant_id: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil}

    def thing_fixture(attrs \\ %{}) do
      {:ok, thing} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Concept.create_thing()

      thing
    end

    test "list_things/0 returns all things" do
      thing = thing_fixture()
      assert Concept.list_things() == [thing]
    end

    test "get_thing!/1 returns the thing with given id" do
      thing = thing_fixture()
      assert Concept.get_thing!(thing.id) == thing
    end

    test "create_thing/1 with valid data creates a thing" do
      assert {:ok, %Thing{} = thing} = Concept.create_thing(@valid_attrs)
      assert thing.name == "some name"
      assert thing.state_text == "some state_text"
      assert thing.state_uri == "some state_uri"
      assert thing.tenant_id == "7488a646-e31f-11e4-aace-600308960662"
      assert thing.type_text == "some type_text"
      assert thing.type_uri == "some type_uri"
      assert thing.updated_at_clock_count == 42
      assert thing.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert thing.updated_by_text == "some updated_by_text"
    end

    test "create_thing/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Concept.create_thing(@invalid_attrs)
    end

    test "update_thing/2 with valid data updates the thing" do
      thing = thing_fixture()
      assert {:ok, %Thing{} = thing} = Concept.update_thing(thing, @update_attrs)
      assert thing.name == "some updated name"
      assert thing.state_text == "some updated state_text"
      assert thing.state_uri == "some updated state_uri"
      assert thing.tenant_id == "7488a646-e31f-11e4-aace-600308960668"
      assert thing.type_text == "some updated type_text"
      assert thing.type_uri == "some updated type_uri"
      assert thing.updated_at_clock_count == 43
      assert thing.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert thing.updated_by_text == "some updated updated_by_text"
    end

    test "update_thing/2 with invalid data returns error changeset" do
      thing = thing_fixture()
      assert {:error, %Ecto.Changeset{}} = Concept.update_thing(thing, @invalid_attrs)
      assert thing == Concept.get_thing!(thing.id)
    end

    test "delete_thing/1 deletes the thing" do
      thing = thing_fixture()
      assert {:ok, %Thing{}} = Concept.delete_thing(thing)
      assert_raise Ecto.NoResultsError, fn -> Concept.get_thing!(thing.id) end
    end

    test "change_thing/1 returns a thing changeset" do
      thing = thing_fixture()
      assert %Ecto.Changeset{} = Concept.change_thing(thing)
    end
  end

  describe "events" do
    alias Contact.Concept.Event

    @valid_attrs %{name: "some name", state_text: "some state_text", state_uri: "some state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960662", type_text: "some type_text", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_text: "some updated_by_text"}
    @update_attrs %{name: "some updated name", state_text: "some updated state_text", state_uri: "some updated state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960668", type_text: "some updated type_text", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_text: "some updated updated_by_text"}
    @invalid_attrs %{name: nil, state_text: nil, state_uri: nil, tenant_id: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil}

    def event_fixture(attrs \\ %{}) do
      {:ok, event} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Concept.create_event()

      event
    end

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Concept.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Concept.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      assert {:ok, %Event{} = event} = Concept.create_event(@valid_attrs)
      assert event.name == "some name"
      assert event.state_text == "some state_text"
      assert event.state_uri == "some state_uri"
      assert event.tenant_id == "7488a646-e31f-11e4-aace-600308960662"
      assert event.type_text == "some type_text"
      assert event.type_uri == "some type_uri"
      assert event.updated_at_clock_count == 42
      assert event.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert event.updated_by_text == "some updated_by_text"
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Concept.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      assert {:ok, %Event{} = event} = Concept.update_event(event, @update_attrs)
      assert event.name == "some updated name"
      assert event.state_text == "some updated state_text"
      assert event.state_uri == "some updated state_uri"
      assert event.tenant_id == "7488a646-e31f-11e4-aace-600308960668"
      assert event.type_text == "some updated type_text"
      assert event.type_uri == "some updated type_uri"
      assert event.updated_at_clock_count == 43
      assert event.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert event.updated_by_text == "some updated updated_by_text"
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Concept.update_event(event, @invalid_attrs)
      assert event == Concept.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Concept.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Concept.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Concept.change_event(event)
    end
  end

  describe "person_name_kits" do
    alias Contact.Concept.PersonNameKit

    @valid_attrs %{addressee_name: "some addressee_name", addressee_name_phonetic: "some addressee_name_phonetic", created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], family_name: "some family_name", family_name_phonetic: "some family_name_phonetic", given_name: "some given_name", given_name_phonetic: "some given_name_phonetic", legal_name: "some legal_name", legal_name_phonetic: "some legal_name_phonetic", locale_id: "7488a646-e31f-11e4-aace-600308960662", middle_name: "some middle_name", middle_name_phonetic: "some middle_name_phonetic", nickname: "some nickname", nickname_phonetic: "some nickname_phonetic", prefix_name: "some prefix_name", prefix_name_phonetic: "some prefix_name_phonetic", salutation_name: "some salutation_name", salutation_name_phonetic: "some salutation_name_phonetic", state_uri: "some state_uri", suffix_name: "some suffix_name", suffix_name_phonetic: "some suffix_name_phonetic", tenant_uri: "some tenant_uri", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
    @update_attrs %{addressee_name: "some updated addressee_name", addressee_name_phonetic: "some updated addressee_name_phonetic", created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], family_name: "some updated family_name", family_name_phonetic: "some updated family_name_phonetic", given_name: "some updated given_name", given_name_phonetic: "some updated given_name_phonetic", legal_name: "some updated legal_name", legal_name_phonetic: "some updated legal_name_phonetic", locale_id: "7488a646-e31f-11e4-aace-600308960668", middle_name: "some updated middle_name", middle_name_phonetic: "some updated middle_name_phonetic", nickname: "some updated nickname", nickname_phonetic: "some updated nickname_phonetic", prefix_name: "some updated prefix_name", prefix_name_phonetic: "some updated prefix_name_phonetic", salutation_name: "some updated salutation_name", salutation_name_phonetic: "some updated salutation_name_phonetic", state_uri: "some updated state_uri", suffix_name: "some updated suffix_name", suffix_name_phonetic: "some updated suffix_name_phonetic", tenant_uri: "some updated tenant_uri", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
    @invalid_attrs %{addressee_name: nil, addressee_name_phonetic: nil, created_at_clock_count: nil, created_at_timestamp_utc: nil, family_name: nil, family_name_phonetic: nil, given_name: nil, given_name_phonetic: nil, legal_name: nil, legal_name_phonetic: nil, locale_id: nil, middle_name: nil, middle_name_phonetic: nil, nickname: nil, nickname_phonetic: nil, prefix_name: nil, prefix_name_phonetic: nil, salutation_name: nil, salutation_name_phonetic: nil, state_uri: nil, suffix_name: nil, suffix_name_phonetic: nil, tenant_uri: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

    def person_name_kit_fixture(attrs \\ %{}) do
      {:ok, person_name_kit} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Concept.create_person_name_kit()

      person_name_kit
    end

    test "list_person_name_kits/0 returns all person_name_kits" do
      person_name_kit = person_name_kit_fixture()
      assert Concept.list_person_name_kits() == [person_name_kit]
    end

    test "get_person_name_kit!/1 returns the person_name_kit with given id" do
      person_name_kit = person_name_kit_fixture()
      assert Concept.get_person_name_kit!(person_name_kit.id) == person_name_kit
    end

    test "create_person_name_kit/1 with valid data creates a person_name_kit" do
      assert {:ok, %PersonNameKit{} = person_name_kit} = Concept.create_person_name_kit(@valid_attrs)
      assert person_name_kit.addressee_name == "some addressee_name"
      assert person_name_kit.addressee_name_phonetic == "some addressee_name_phonetic"
      assert person_name_kit.created_at_clock_count == 42
      assert person_name_kit.created_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert person_name_kit.family_name == "some family_name"
      assert person_name_kit.family_name_phonetic == "some family_name_phonetic"
      assert person_name_kit.given_name == "some given_name"
      assert person_name_kit.given_name_phonetic == "some given_name_phonetic"
      assert person_name_kit.legal_name == "some legal_name"
      assert person_name_kit.legal_name_phonetic == "some legal_name_phonetic"
      assert person_name_kit.locale_id == "7488a646-e31f-11e4-aace-600308960662"
      assert person_name_kit.middle_name == "some middle_name"
      assert person_name_kit.middle_name_phonetic == "some middle_name_phonetic"
      assert person_name_kit.nickname == "some nickname"
      assert person_name_kit.nickname_phonetic == "some nickname_phonetic"
      assert person_name_kit.prefix_name == "some prefix_name"
      assert person_name_kit.prefix_name_phonetic == "some prefix_name_phonetic"
      assert person_name_kit.salutation_name == "some salutation_name"
      assert person_name_kit.salutation_name_phonetic == "some salutation_name_phonetic"
      assert person_name_kit.state_uri == "some state_uri"
      assert person_name_kit.suffix_name == "some suffix_name"
      assert person_name_kit.suffix_name_phonetic == "some suffix_name_phonetic"
      assert person_name_kit.tenant_uri == "some tenant_uri"
      assert person_name_kit.type_uri == "some type_uri"
      assert person_name_kit.updated_at_clock_count == 42
      assert person_name_kit.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert person_name_kit.updated_by_uri == "some updated_by_uri"
    end

    test "create_person_name_kit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Concept.create_person_name_kit(@invalid_attrs)
    end

    test "update_person_name_kit/2 with valid data updates the person_name_kit" do
      person_name_kit = person_name_kit_fixture()
      assert {:ok, %PersonNameKit{} = person_name_kit} = Concept.update_person_name_kit(person_name_kit, @update_attrs)
      assert person_name_kit.addressee_name == "some updated addressee_name"
      assert person_name_kit.addressee_name_phonetic == "some updated addressee_name_phonetic"
      assert person_name_kit.created_at_clock_count == 43
      assert person_name_kit.created_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert person_name_kit.family_name == "some updated family_name"
      assert person_name_kit.family_name_phonetic == "some updated family_name_phonetic"
      assert person_name_kit.given_name == "some updated given_name"
      assert person_name_kit.given_name_phonetic == "some updated given_name_phonetic"
      assert person_name_kit.legal_name == "some updated legal_name"
      assert person_name_kit.legal_name_phonetic == "some updated legal_name_phonetic"
      assert person_name_kit.locale_id == "7488a646-e31f-11e4-aace-600308960668"
      assert person_name_kit.middle_name == "some updated middle_name"
      assert person_name_kit.middle_name_phonetic == "some updated middle_name_phonetic"
      assert person_name_kit.nickname == "some updated nickname"
      assert person_name_kit.nickname_phonetic == "some updated nickname_phonetic"
      assert person_name_kit.prefix_name == "some updated prefix_name"
      assert person_name_kit.prefix_name_phonetic == "some updated prefix_name_phonetic"
      assert person_name_kit.salutation_name == "some updated salutation_name"
      assert person_name_kit.salutation_name_phonetic == "some updated salutation_name_phonetic"
      assert person_name_kit.state_uri == "some updated state_uri"
      assert person_name_kit.suffix_name == "some updated suffix_name"
      assert person_name_kit.suffix_name_phonetic == "some updated suffix_name_phonetic"
      assert person_name_kit.tenant_uri == "some updated tenant_uri"
      assert person_name_kit.type_uri == "some updated type_uri"
      assert person_name_kit.updated_at_clock_count == 43
      assert person_name_kit.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert person_name_kit.updated_by_uri == "some updated updated_by_uri"
    end

    test "update_person_name_kit/2 with invalid data returns error changeset" do
      person_name_kit = person_name_kit_fixture()
      assert {:error, %Ecto.Changeset{}} = Concept.update_person_name_kit(person_name_kit, @invalid_attrs)
      assert person_name_kit == Concept.get_person_name_kit!(person_name_kit.id)
    end

    test "delete_person_name_kit/1 deletes the person_name_kit" do
      person_name_kit = person_name_kit_fixture()
      assert {:ok, %PersonNameKit{}} = Concept.delete_person_name_kit(person_name_kit)
      assert_raise Ecto.NoResultsError, fn -> Concept.get_person_name_kit!(person_name_kit.id) end
    end

    test "change_person_name_kit/1 returns a person_name_kit changeset" do
      person_name_kit = person_name_kit_fixture()
      assert %Ecto.Changeset{} = Concept.change_person_name_kit(person_name_kit)
    end
  end

  describe "artists" do
    alias Contact.Concept.Artist

    @valid_attrs %{created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], saga: "some saga", state_uri: "some state_uri", subtitle: "some subtitle", summary: "some summary", tenant_uri: "some tenant_uri", title: "some title", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
    @update_attrs %{created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], saga: "some updated saga", state_uri: "some updated state_uri", subtitle: "some updated subtitle", summary: "some updated summary", tenant_uri: "some updated tenant_uri", title: "some updated title", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
    @invalid_attrs %{created_at_clock_count: nil, created_at_timestamp_utc: nil, saga: nil, state_uri: nil, subtitle: nil, summary: nil, tenant_uri: nil, title: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

    def artist_fixture(attrs \\ %{}) do
      {:ok, artist} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Concept.create_artist()

      artist
    end

    test "list_artists/0 returns all artists" do
      artist = artist_fixture()
      assert Concept.list_artists() == [artist]
    end

    test "get_artist!/1 returns the artist with given id" do
      artist = artist_fixture()
      assert Concept.get_artist!(artist.id) == artist
    end

    test "create_artist/1 with valid data creates a artist" do
      assert {:ok, %Artist{} = artist} = Concept.create_artist(@valid_attrs)
      assert artist.created_at_clock_count == 42
      assert artist.created_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert artist.saga == "some saga"
      assert artist.state_uri == "some state_uri"
      assert artist.subtitle == "some subtitle"
      assert artist.summary == "some summary"
      assert artist.tenant_uri == "some tenant_uri"
      assert artist.title == "some title"
      assert artist.type_uri == "some type_uri"
      assert artist.updated_at_clock_count == 42
      assert artist.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert artist.updated_by_uri == "some updated_by_uri"
    end

    test "create_artist/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Concept.create_artist(@invalid_attrs)
    end

    test "update_artist/2 with valid data updates the artist" do
      artist = artist_fixture()
      assert {:ok, %Artist{} = artist} = Concept.update_artist(artist, @update_attrs)
      assert artist.created_at_clock_count == 43
      assert artist.created_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert artist.saga == "some updated saga"
      assert artist.state_uri == "some updated state_uri"
      assert artist.subtitle == "some updated subtitle"
      assert artist.summary == "some updated summary"
      assert artist.tenant_uri == "some updated tenant_uri"
      assert artist.title == "some updated title"
      assert artist.type_uri == "some updated type_uri"
      assert artist.updated_at_clock_count == 43
      assert artist.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert artist.updated_by_uri == "some updated updated_by_uri"
    end

    test "update_artist/2 with invalid data returns error changeset" do
      artist = artist_fixture()
      assert {:error, %Ecto.Changeset{}} = Concept.update_artist(artist, @invalid_attrs)
      assert artist == Concept.get_artist!(artist.id)
    end

    test "delete_artist/1 deletes the artist" do
      artist = artist_fixture()
      assert {:ok, %Artist{}} = Concept.delete_artist(artist)
      assert_raise Ecto.NoResultsError, fn -> Concept.get_artist!(artist.id) end
    end

    test "change_artist/1 returns a artist changeset" do
      artist = artist_fixture()
      assert %Ecto.Changeset{} = Concept.change_artist(artist)
    end
  end

  describe "books" do
    alias Contact.Concept.Book

    @valid_attrs %{created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], saga: "some saga", state_uri: "some state_uri", subtitle: "some subtitle", summary: "some summary", tenant_uri: "some tenant_uri", title: "some title", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
    @update_attrs %{created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], saga: "some updated saga", state_uri: "some updated state_uri", subtitle: "some updated subtitle", summary: "some updated summary", tenant_uri: "some updated tenant_uri", title: "some updated title", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
    @invalid_attrs %{created_at_clock_count: nil, created_at_timestamp_utc: nil, saga: nil, state_uri: nil, subtitle: nil, summary: nil, tenant_uri: nil, title: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Concept.create_book()

      book
    end

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Concept.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Concept.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      assert {:ok, %Book{} = book} = Concept.create_book(@valid_attrs)
      assert book.created_at_clock_count == 42
      assert book.created_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert book.saga == "some saga"
      assert book.state_uri == "some state_uri"
      assert book.subtitle == "some subtitle"
      assert book.summary == "some summary"
      assert book.tenant_uri == "some tenant_uri"
      assert book.title == "some title"
      assert book.type_uri == "some type_uri"
      assert book.updated_at_clock_count == 42
      assert book.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert book.updated_by_uri == "some updated_by_uri"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Concept.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      assert {:ok, %Book{} = book} = Concept.update_book(book, @update_attrs)
      assert book.created_at_clock_count == 43
      assert book.created_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert book.saga == "some updated saga"
      assert book.state_uri == "some updated state_uri"
      assert book.subtitle == "some updated subtitle"
      assert book.summary == "some updated summary"
      assert book.tenant_uri == "some updated tenant_uri"
      assert book.title == "some updated title"
      assert book.type_uri == "some updated type_uri"
      assert book.updated_at_clock_count == 43
      assert book.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert book.updated_by_uri == "some updated updated_by_uri"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Concept.update_book(book, @invalid_attrs)
      assert book == Concept.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Concept.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Concept.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Concept.change_book(book)
    end
  end

  describe "jobs" do
    alias Contact.Concept.Job

    @valid_attrs %{created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], saga: "some saga", state_uri: "some state_uri", subtitle: "some subtitle", summary: "some summary", tenant_uri: "some tenant_uri", title: "some title", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
    @update_attrs %{created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], saga: "some updated saga", state_uri: "some updated state_uri", subtitle: "some updated subtitle", summary: "some updated summary", tenant_uri: "some updated tenant_uri", title: "some updated title", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
    @invalid_attrs %{created_at_clock_count: nil, created_at_timestamp_utc: nil, saga: nil, state_uri: nil, subtitle: nil, summary: nil, tenant_uri: nil, title: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

    def job_fixture(attrs \\ %{}) do
      {:ok, job} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Concept.create_job()

      job
    end

    test "list_jobs/0 returns all jobs" do
      job = job_fixture()
      assert Concept.list_jobs() == [job]
    end

    test "get_job!/1 returns the job with given id" do
      job = job_fixture()
      assert Concept.get_job!(job.id) == job
    end

    test "create_job/1 with valid data creates a job" do
      assert {:ok, %Job{} = job} = Concept.create_job(@valid_attrs)
      assert job.created_at_clock_count == 42
      assert job.created_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert job.saga == "some saga"
      assert job.state_uri == "some state_uri"
      assert job.subtitle == "some subtitle"
      assert job.summary == "some summary"
      assert job.tenant_uri == "some tenant_uri"
      assert job.title == "some title"
      assert job.type_uri == "some type_uri"
      assert job.updated_at_clock_count == 42
      assert job.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert job.updated_by_uri == "some updated_by_uri"
    end

    test "create_job/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Concept.create_job(@invalid_attrs)
    end

    test "update_job/2 with valid data updates the job" do
      job = job_fixture()
      assert {:ok, %Job{} = job} = Concept.update_job(job, @update_attrs)
      assert job.created_at_clock_count == 43
      assert job.created_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert job.saga == "some updated saga"
      assert job.state_uri == "some updated state_uri"
      assert job.subtitle == "some updated subtitle"
      assert job.summary == "some updated summary"
      assert job.tenant_uri == "some updated tenant_uri"
      assert job.title == "some updated title"
      assert job.type_uri == "some updated type_uri"
      assert job.updated_at_clock_count == 43
      assert job.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert job.updated_by_uri == "some updated updated_by_uri"
    end

    test "update_job/2 with invalid data returns error changeset" do
      job = job_fixture()
      assert {:error, %Ecto.Changeset{}} = Concept.update_job(job, @invalid_attrs)
      assert job == Concept.get_job!(job.id)
    end

    test "delete_job/1 deletes the job" do
      job = job_fixture()
      assert {:ok, %Job{}} = Concept.delete_job(job)
      assert_raise Ecto.NoResultsError, fn -> Concept.get_job!(job.id) end
    end

    test "change_job/1 returns a job changeset" do
      job = job_fixture()
      assert %Ecto.Changeset{} = Concept.change_job(job)
    end
  end

  describe "movies" do
    alias Contact.Concept.Movie

    @valid_attrs %{created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], saga: "some saga", state_uri: "some state_uri", subtitle: "some subtitle", summary: "some summary", tenant_uri: "some tenant_uri", title: "some title", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
    @update_attrs %{created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], saga: "some updated saga", state_uri: "some updated state_uri", subtitle: "some updated subtitle", summary: "some updated summary", tenant_uri: "some updated tenant_uri", title: "some updated title", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
    @invalid_attrs %{created_at_clock_count: nil, created_at_timestamp_utc: nil, saga: nil, state_uri: nil, subtitle: nil, summary: nil, tenant_uri: nil, title: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

    def movie_fixture(attrs \\ %{}) do
      {:ok, movie} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Concept.create_movie()

      movie
    end

    test "list_movies/0 returns all movies" do
      movie = movie_fixture()
      assert Concept.list_movies() == [movie]
    end

    test "get_movie!/1 returns the movie with given id" do
      movie = movie_fixture()
      assert Concept.get_movie!(movie.id) == movie
    end

    test "create_movie/1 with valid data creates a movie" do
      assert {:ok, %Movie{} = movie} = Concept.create_movie(@valid_attrs)
      assert movie.created_at_clock_count == 42
      assert movie.created_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert movie.saga == "some saga"
      assert movie.state_uri == "some state_uri"
      assert movie.subtitle == "some subtitle"
      assert movie.summary == "some summary"
      assert movie.tenant_uri == "some tenant_uri"
      assert movie.title == "some title"
      assert movie.type_uri == "some type_uri"
      assert movie.updated_at_clock_count == 42
      assert movie.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert movie.updated_by_uri == "some updated_by_uri"
    end

    test "create_movie/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Concept.create_movie(@invalid_attrs)
    end

    test "update_movie/2 with valid data updates the movie" do
      movie = movie_fixture()
      assert {:ok, %Movie{} = movie} = Concept.update_movie(movie, @update_attrs)
      assert movie.created_at_clock_count == 43
      assert movie.created_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert movie.saga == "some updated saga"
      assert movie.state_uri == "some updated state_uri"
      assert movie.subtitle == "some updated subtitle"
      assert movie.summary == "some updated summary"
      assert movie.tenant_uri == "some updated tenant_uri"
      assert movie.title == "some updated title"
      assert movie.type_uri == "some updated type_uri"
      assert movie.updated_at_clock_count == 43
      assert movie.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert movie.updated_by_uri == "some updated updated_by_uri"
    end

    test "update_movie/2 with invalid data returns error changeset" do
      movie = movie_fixture()
      assert {:error, %Ecto.Changeset{}} = Concept.update_movie(movie, @invalid_attrs)
      assert movie == Concept.get_movie!(movie.id)
    end

    test "delete_movie/1 deletes the movie" do
      movie = movie_fixture()
      assert {:ok, %Movie{}} = Concept.delete_movie(movie)
      assert_raise Ecto.NoResultsError, fn -> Concept.get_movie!(movie.id) end
    end

    test "change_movie/1 returns a movie changeset" do
      movie = movie_fixture()
      assert %Ecto.Changeset{} = Concept.change_movie(movie)
    end
  end

  describe "offers" do
    alias Contact.Concept.Offer

    @valid_attrs %{created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], saga: "some saga", state_uri: "some state_uri", subtitle: "some subtitle", summary: "some summary", tenant_uri: "some tenant_uri", title: "some title", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
    @update_attrs %{created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], saga: "some updated saga", state_uri: "some updated state_uri", subtitle: "some updated subtitle", summary: "some updated summary", tenant_uri: "some updated tenant_uri", title: "some updated title", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
    @invalid_attrs %{created_at_clock_count: nil, created_at_timestamp_utc: nil, saga: nil, state_uri: nil, subtitle: nil, summary: nil, tenant_uri: nil, title: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

    def offer_fixture(attrs \\ %{}) do
      {:ok, offer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Concept.create_offer()

      offer
    end

    test "list_offers/0 returns all offers" do
      offer = offer_fixture()
      assert Concept.list_offers() == [offer]
    end

    test "get_offer!/1 returns the offer with given id" do
      offer = offer_fixture()
      assert Concept.get_offer!(offer.id) == offer
    end

    test "create_offer/1 with valid data creates a offer" do
      assert {:ok, %Offer{} = offer} = Concept.create_offer(@valid_attrs)
      assert offer.created_at_clock_count == 42
      assert offer.created_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert offer.saga == "some saga"
      assert offer.state_uri == "some state_uri"
      assert offer.subtitle == "some subtitle"
      assert offer.summary == "some summary"
      assert offer.tenant_uri == "some tenant_uri"
      assert offer.title == "some title"
      assert offer.type_uri == "some type_uri"
      assert offer.updated_at_clock_count == 42
      assert offer.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert offer.updated_by_uri == "some updated_by_uri"
    end

    test "create_offer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Concept.create_offer(@invalid_attrs)
    end

    test "update_offer/2 with valid data updates the offer" do
      offer = offer_fixture()
      assert {:ok, %Offer{} = offer} = Concept.update_offer(offer, @update_attrs)
      assert offer.created_at_clock_count == 43
      assert offer.created_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert offer.saga == "some updated saga"
      assert offer.state_uri == "some updated state_uri"
      assert offer.subtitle == "some updated subtitle"
      assert offer.summary == "some updated summary"
      assert offer.tenant_uri == "some updated tenant_uri"
      assert offer.title == "some updated title"
      assert offer.type_uri == "some updated type_uri"
      assert offer.updated_at_clock_count == 43
      assert offer.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert offer.updated_by_uri == "some updated updated_by_uri"
    end

    test "update_offer/2 with invalid data returns error changeset" do
      offer = offer_fixture()
      assert {:error, %Ecto.Changeset{}} = Concept.update_offer(offer, @invalid_attrs)
      assert offer == Concept.get_offer!(offer.id)
    end

    test "delete_offer/1 deletes the offer" do
      offer = offer_fixture()
      assert {:ok, %Offer{}} = Concept.delete_offer(offer)
      assert_raise Ecto.NoResultsError, fn -> Concept.get_offer!(offer.id) end
    end

    test "change_offer/1 returns a offer changeset" do
      offer = offer_fixture()
      assert %Ecto.Changeset{} = Concept.change_offer(offer)
    end
  end

  describe "organizations" do
    alias Contact.Concept.Organization

    @valid_attrs %{created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], saga: "some saga", state_uri: "some state_uri", subtitle: "some subtitle", summary: "some summary", tenant_uri: "some tenant_uri", title: "some title", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
    @update_attrs %{created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], saga: "some updated saga", state_uri: "some updated state_uri", subtitle: "some updated subtitle", summary: "some updated summary", tenant_uri: "some updated tenant_uri", title: "some updated title", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
    @invalid_attrs %{created_at_clock_count: nil, created_at_timestamp_utc: nil, saga: nil, state_uri: nil, subtitle: nil, summary: nil, tenant_uri: nil, title: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

    def organization_fixture(attrs \\ %{}) do
      {:ok, organization} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Concept.create_organization()

      organization
    end

    test "list_organizations/0 returns all organizations" do
      organization = organization_fixture()
      assert Concept.list_organizations() == [organization]
    end

    test "get_organization!/1 returns the organization with given id" do
      organization = organization_fixture()
      assert Concept.get_organization!(organization.id) == organization
    end

    test "create_organization/1 with valid data creates a organization" do
      assert {:ok, %Organization{} = organization} = Concept.create_organization(@valid_attrs)
      assert organization.created_at_clock_count == 42
      assert organization.created_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert organization.saga == "some saga"
      assert organization.state_uri == "some state_uri"
      assert organization.subtitle == "some subtitle"
      assert organization.summary == "some summary"
      assert organization.tenant_uri == "some tenant_uri"
      assert organization.title == "some title"
      assert organization.type_uri == "some type_uri"
      assert organization.updated_at_clock_count == 42
      assert organization.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert organization.updated_by_uri == "some updated_by_uri"
    end

    test "create_organization/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Concept.create_organization(@invalid_attrs)
    end

    test "update_organization/2 with valid data updates the organization" do
      organization = organization_fixture()
      assert {:ok, %Organization{} = organization} = Concept.update_organization(organization, @update_attrs)
      assert organization.created_at_clock_count == 43
      assert organization.created_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert organization.saga == "some updated saga"
      assert organization.state_uri == "some updated state_uri"
      assert organization.subtitle == "some updated subtitle"
      assert organization.summary == "some updated summary"
      assert organization.tenant_uri == "some updated tenant_uri"
      assert organization.title == "some updated title"
      assert organization.type_uri == "some updated type_uri"
      assert organization.updated_at_clock_count == 43
      assert organization.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert organization.updated_by_uri == "some updated updated_by_uri"
    end

    test "update_organization/2 with invalid data returns error changeset" do
      organization = organization_fixture()
      assert {:error, %Ecto.Changeset{}} = Concept.update_organization(organization, @invalid_attrs)
      assert organization == Concept.get_organization!(organization.id)
    end

    test "delete_organization/1 deletes the organization" do
      organization = organization_fixture()
      assert {:ok, %Organization{}} = Concept.delete_organization(organization)
      assert_raise Ecto.NoResultsError, fn -> Concept.get_organization!(organization.id) end
    end

    test "change_organization/1 returns a organization changeset" do
      organization = organization_fixture()
      assert %Ecto.Changeset{} = Concept.change_organization(organization)
    end
  end

  describe "sports" do
    alias Contact.Concept.Sport

    @valid_attrs %{created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], saga: "some saga", state_uri: "some state_uri", subtitle: "some subtitle", summary: "some summary", tenant_uri: "some tenant_uri", title: "some title", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
    @update_attrs %{created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], saga: "some updated saga", state_uri: "some updated state_uri", subtitle: "some updated subtitle", summary: "some updated summary", tenant_uri: "some updated tenant_uri", title: "some updated title", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
    @invalid_attrs %{created_at_clock_count: nil, created_at_timestamp_utc: nil, saga: nil, state_uri: nil, subtitle: nil, summary: nil, tenant_uri: nil, title: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

    def sport_fixture(attrs \\ %{}) do
      {:ok, sport} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Concept.create_sport()

      sport
    end

    test "list_sports/0 returns all sports" do
      sport = sport_fixture()
      assert Concept.list_sports() == [sport]
    end

    test "get_sport!/1 returns the sport with given id" do
      sport = sport_fixture()
      assert Concept.get_sport!(sport.id) == sport
    end

    test "create_sport/1 with valid data creates a sport" do
      assert {:ok, %Sport{} = sport} = Concept.create_sport(@valid_attrs)
      assert sport.created_at_clock_count == 42
      assert sport.created_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert sport.saga == "some saga"
      assert sport.state_uri == "some state_uri"
      assert sport.subtitle == "some subtitle"
      assert sport.summary == "some summary"
      assert sport.tenant_uri == "some tenant_uri"
      assert sport.title == "some title"
      assert sport.type_uri == "some type_uri"
      assert sport.updated_at_clock_count == 42
      assert sport.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert sport.updated_by_uri == "some updated_by_uri"
    end

    test "create_sport/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Concept.create_sport(@invalid_attrs)
    end

    test "update_sport/2 with valid data updates the sport" do
      sport = sport_fixture()
      assert {:ok, %Sport{} = sport} = Concept.update_sport(sport, @update_attrs)
      assert sport.created_at_clock_count == 43
      assert sport.created_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert sport.saga == "some updated saga"
      assert sport.state_uri == "some updated state_uri"
      assert sport.subtitle == "some updated subtitle"
      assert sport.summary == "some updated summary"
      assert sport.tenant_uri == "some updated tenant_uri"
      assert sport.title == "some updated title"
      assert sport.type_uri == "some updated type_uri"
      assert sport.updated_at_clock_count == 43
      assert sport.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert sport.updated_by_uri == "some updated updated_by_uri"
    end

    test "update_sport/2 with invalid data returns error changeset" do
      sport = sport_fixture()
      assert {:error, %Ecto.Changeset{}} = Concept.update_sport(sport, @invalid_attrs)
      assert sport == Concept.get_sport!(sport.id)
    end

    test "delete_sport/1 deletes the sport" do
      sport = sport_fixture()
      assert {:ok, %Sport{}} = Concept.delete_sport(sport)
      assert_raise Ecto.NoResultsError, fn -> Concept.get_sport!(sport.id) end
    end

    test "change_sport/1 returns a sport changeset" do
      sport = sport_fixture()
      assert %Ecto.Changeset{} = Concept.change_sport(sport)
    end
  end

  describe "travels" do
    alias Contact.Concept.Travel

    @valid_attrs %{created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], saga: "some saga", state_uri: "some state_uri", subtitle: "some subtitle", summary: "some summary", tenant_uri: "some tenant_uri", title: "some title", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
    @update_attrs %{created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], saga: "some updated saga", state_uri: "some updated state_uri", subtitle: "some updated subtitle", summary: "some updated summary", tenant_uri: "some updated tenant_uri", title: "some updated title", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
    @invalid_attrs %{created_at_clock_count: nil, created_at_timestamp_utc: nil, saga: nil, state_uri: nil, subtitle: nil, summary: nil, tenant_uri: nil, title: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

    def travel_fixture(attrs \\ %{}) do
      {:ok, travel} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Concept.create_travel()

      travel
    end

    test "list_travels/0 returns all travels" do
      travel = travel_fixture()
      assert Concept.list_travels() == [travel]
    end

    test "get_travel!/1 returns the travel with given id" do
      travel = travel_fixture()
      assert Concept.get_travel!(travel.id) == travel
    end

    test "create_travel/1 with valid data creates a travel" do
      assert {:ok, %Travel{} = travel} = Concept.create_travel(@valid_attrs)
      assert travel.created_at_clock_count == 42
      assert travel.created_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert travel.saga == "some saga"
      assert travel.state_uri == "some state_uri"
      assert travel.subtitle == "some subtitle"
      assert travel.summary == "some summary"
      assert travel.tenant_uri == "some tenant_uri"
      assert travel.title == "some title"
      assert travel.type_uri == "some type_uri"
      assert travel.updated_at_clock_count == 42
      assert travel.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert travel.updated_by_uri == "some updated_by_uri"
    end

    test "create_travel/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Concept.create_travel(@invalid_attrs)
    end

    test "update_travel/2 with valid data updates the travel" do
      travel = travel_fixture()
      assert {:ok, %Travel{} = travel} = Concept.update_travel(travel, @update_attrs)
      assert travel.created_at_clock_count == 43
      assert travel.created_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert travel.saga == "some updated saga"
      assert travel.state_uri == "some updated state_uri"
      assert travel.subtitle == "some updated subtitle"
      assert travel.summary == "some updated summary"
      assert travel.tenant_uri == "some updated tenant_uri"
      assert travel.title == "some updated title"
      assert travel.type_uri == "some updated type_uri"
      assert travel.updated_at_clock_count == 43
      assert travel.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert travel.updated_by_uri == "some updated updated_by_uri"
    end

    test "update_travel/2 with invalid data returns error changeset" do
      travel = travel_fixture()
      assert {:error, %Ecto.Changeset{}} = Concept.update_travel(travel, @invalid_attrs)
      assert travel == Concept.get_travel!(travel.id)
    end

    test "delete_travel/1 deletes the travel" do
      travel = travel_fixture()
      assert {:ok, %Travel{}} = Concept.delete_travel(travel)
      assert_raise Ecto.NoResultsError, fn -> Concept.get_travel!(travel.id) end
    end

    test "change_travel/1 returns a travel changeset" do
      travel = travel_fixture()
      assert %Ecto.Changeset{} = Concept.change_travel(travel)
    end
  end
end
