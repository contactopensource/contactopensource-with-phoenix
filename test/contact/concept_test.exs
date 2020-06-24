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
end
