defmodule ContactWeb.PersonNameKitControllerTest do
  use ContactWeb.ConnCase

  alias Contact.Concept

  @create_attrs %{addressee_name: "some addressee_name", addressee_name_phonetic: "some addressee_name_phonetic", created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], family_name: "some family_name", family_name_phonetic: "some family_name_phonetic", given_name: "some given_name", given_name_phonetic: "some given_name_phonetic", legal_name: "some legal_name", legal_name_phonetic: "some legal_name_phonetic", locale_id: "7488a646-e31f-11e4-aace-600308960662", middle_name: "some middle_name", middle_name_phonetic: "some middle_name_phonetic", nickname: "some nickname", nickname_phonetic: "some nickname_phonetic", prefix_name: "some prefix_name", prefix_name_phonetic: "some prefix_name_phonetic", salutation_name: "some salutation_name", salutation_name_phonetic: "some salutation_name_phonetic", state_uri: "some state_uri", suffix_name: "some suffix_name", suffix_name_phonetic: "some suffix_name_phonetic", tenant_uri: "some tenant_uri", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
  @update_attrs %{addressee_name: "some updated addressee_name", addressee_name_phonetic: "some updated addressee_name_phonetic", created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], family_name: "some updated family_name", family_name_phonetic: "some updated family_name_phonetic", given_name: "some updated given_name", given_name_phonetic: "some updated given_name_phonetic", legal_name: "some updated legal_name", legal_name_phonetic: "some updated legal_name_phonetic", locale_id: "7488a646-e31f-11e4-aace-600308960668", middle_name: "some updated middle_name", middle_name_phonetic: "some updated middle_name_phonetic", nickname: "some updated nickname", nickname_phonetic: "some updated nickname_phonetic", prefix_name: "some updated prefix_name", prefix_name_phonetic: "some updated prefix_name_phonetic", salutation_name: "some updated salutation_name", salutation_name_phonetic: "some updated salutation_name_phonetic", state_uri: "some updated state_uri", suffix_name: "some updated suffix_name", suffix_name_phonetic: "some updated suffix_name_phonetic", tenant_uri: "some updated tenant_uri", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
  @invalid_attrs %{addressee_name: nil, addressee_name_phonetic: nil, created_at_clock_count: nil, created_at_timestamp_utc: nil, family_name: nil, family_name_phonetic: nil, given_name: nil, given_name_phonetic: nil, legal_name: nil, legal_name_phonetic: nil, locale_id: nil, middle_name: nil, middle_name_phonetic: nil, nickname: nil, nickname_phonetic: nil, prefix_name: nil, prefix_name_phonetic: nil, salutation_name: nil, salutation_name_phonetic: nil, state_uri: nil, suffix_name: nil, suffix_name_phonetic: nil, tenant_uri: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

  def fixture(:person_name_kit) do
    {:ok, person_name_kit} = Concept.create_person_name_kit(@create_attrs)
    person_name_kit
  end

  describe "index" do
    test "lists all person_name_kits", %{conn: conn} do
      conn = get(conn, Routes.person_name_kit_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Person name kits"
    end
  end

  describe "new person_name_kit" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.person_name_kit_path(conn, :new))
      assert html_response(conn, 200) =~ "New Person name kit"
    end
  end

  describe "create person_name_kit" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.person_name_kit_path(conn, :create), person_name_kit: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.person_name_kit_path(conn, :show, id)

      conn = get(conn, Routes.person_name_kit_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Person name kit"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.person_name_kit_path(conn, :create), person_name_kit: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Person name kit"
    end
  end

  describe "edit person_name_kit" do
    setup [:create_person_name_kit]

    test "renders form for editing chosen person_name_kit", %{conn: conn, person_name_kit: person_name_kit} do
      conn = get(conn, Routes.person_name_kit_path(conn, :edit, person_name_kit))
      assert html_response(conn, 200) =~ "Edit Person name kit"
    end
  end

  describe "update person_name_kit" do
    setup [:create_person_name_kit]

    test "redirects when data is valid", %{conn: conn, person_name_kit: person_name_kit} do
      conn = put(conn, Routes.person_name_kit_path(conn, :update, person_name_kit), person_name_kit: @update_attrs)
      assert redirected_to(conn) == Routes.person_name_kit_path(conn, :show, person_name_kit)

      conn = get(conn, Routes.person_name_kit_path(conn, :show, person_name_kit))
      assert html_response(conn, 200) =~ "some updated addressee_name"
    end

    test "renders errors when data is invalid", %{conn: conn, person_name_kit: person_name_kit} do
      conn = put(conn, Routes.person_name_kit_path(conn, :update, person_name_kit), person_name_kit: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Person name kit"
    end
  end

  describe "delete person_name_kit" do
    setup [:create_person_name_kit]

    test "deletes chosen person_name_kit", %{conn: conn, person_name_kit: person_name_kit} do
      conn = delete(conn, Routes.person_name_kit_path(conn, :delete, person_name_kit))
      assert redirected_to(conn) == Routes.person_name_kit_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.person_name_kit_path(conn, :show, person_name_kit))
      end
    end
  end

  defp create_person_name_kit(_) do
    person_name_kit = fixture(:person_name_kit)
    {:ok, person_name_kit: person_name_kit}
  end
end
