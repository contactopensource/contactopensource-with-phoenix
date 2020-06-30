defmodule ContactWeb.PersonPronounKitControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Person

  @create_attrs %{created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], dependent_possessive_pronoun: "some dependent_possessive_pronoun", disjunctive_pronoun: "some disjunctive_pronoun", independent_possessive_pronoun: "some independent_possessive_pronoun", intensive_pronoun: "some intensive_pronoun", object_pronoun: "some object_pronoun", reflexive_pronoun: "some reflexive_pronoun", state_uri: "some state_uri", subject_pronoun: "some subject_pronoun", tenant_uri: "some tenant_uri", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
  @update_attrs %{created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], dependent_possessive_pronoun: "some updated dependent_possessive_pronoun", disjunctive_pronoun: "some updated disjunctive_pronoun", independent_possessive_pronoun: "some updated independent_possessive_pronoun", intensive_pronoun: "some updated intensive_pronoun", object_pronoun: "some updated object_pronoun", reflexive_pronoun: "some updated reflexive_pronoun", state_uri: "some updated state_uri", subject_pronoun: "some updated subject_pronoun", tenant_uri: "some updated tenant_uri", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
  @invalid_attrs %{created_at_clock_count: nil, created_at_timestamp_utc: nil, dependent_possessive_pronoun: nil, disjunctive_pronoun: nil, independent_possessive_pronoun: nil, intensive_pronoun: nil, object_pronoun: nil, reflexive_pronoun: nil, state_uri: nil, subject_pronoun: nil, tenant_uri: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

  def fixture(:person_pronoun_kit) do
    {:ok, person_pronoun_kit} = Person.create_person_pronoun_kit(@create_attrs)
    person_pronoun_kit
  end

  describe "index" do
    test "lists all person_pronoun_kits", %{conn: conn} do
      conn = get(conn, Routes.person_pronoun_kit_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Person pronoun kits"
    end
  end

  describe "new person_pronoun_kit" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.person_pronoun_kit_path(conn, :new))
      assert html_response(conn, 200) =~ "New Person pronoun kit"
    end
  end

  describe "create person_pronoun_kit" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.person_pronoun_kit_path(conn, :create), person_pronoun_kit: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.person_pronoun_kit_path(conn, :show, id)

      conn = get(conn, Routes.person_pronoun_kit_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Person pronoun kit"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.person_pronoun_kit_path(conn, :create), person_pronoun_kit: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Person pronoun kit"
    end
  end

  describe "edit person_pronoun_kit" do
    setup [:create_person_pronoun_kit]

    test "renders form for editing chosen person_pronoun_kit", %{conn: conn, person_pronoun_kit: person_pronoun_kit} do
      conn = get(conn, Routes.person_pronoun_kit_path(conn, :edit, person_pronoun_kit))
      assert html_response(conn, 200) =~ "Edit Person pronoun kit"
    end
  end

  describe "update person_pronoun_kit" do
    setup [:create_person_pronoun_kit]

    test "redirects when data is valid", %{conn: conn, person_pronoun_kit: person_pronoun_kit} do
      conn = put(conn, Routes.person_pronoun_kit_path(conn, :update, person_pronoun_kit), person_pronoun_kit: @update_attrs)
      assert redirected_to(conn) == Routes.person_pronoun_kit_path(conn, :show, person_pronoun_kit)

      conn = get(conn, Routes.person_pronoun_kit_path(conn, :show, person_pronoun_kit))
      assert html_response(conn, 200) =~ "some updated dependent_possessive_pronoun"
    end

    test "renders errors when data is invalid", %{conn: conn, person_pronoun_kit: person_pronoun_kit} do
      conn = put(conn, Routes.person_pronoun_kit_path(conn, :update, person_pronoun_kit), person_pronoun_kit: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Person pronoun kit"
    end
  end

  describe "delete person_pronoun_kit" do
    setup [:create_person_pronoun_kit]

    test "deletes chosen person_pronoun_kit", %{conn: conn, person_pronoun_kit: person_pronoun_kit} do
      conn = delete(conn, Routes.person_pronoun_kit_path(conn, :delete, person_pronoun_kit))
      assert redirected_to(conn) == Routes.person_pronoun_kit_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.person_pronoun_kit_path(conn, :show, person_pronoun_kit))
      end
    end
  end

  defp create_person_pronoun_kit(_) do
    person_pronoun_kit = fixture(:person_pronoun_kit)
    {:ok, person_pronoun_kit: person_pronoun_kit}
  end
end
