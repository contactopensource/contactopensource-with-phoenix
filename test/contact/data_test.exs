defmodule Contact.DataTest do
  use Contact.DataCase

  alias Contact.Data

  describe "locales" do
    alias Contact.Data.Locale

    @valid_attrs %{country_code: "some country_code", currency_code: "some currency_code", currency_symbol: "some currency_symbol", decimal_separator: "some decimal_separator", grouping_separator: "some grouping_separator", language_code: "some language_code", quotation_start_delimiter: "some quotation_start_delimiter", quotation_stop_delimiter: "some quotation_stop_delimiter", region_code: "some region_code", script_code: "some script_code", state_text: "some state_text", state_uri: "some state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960662", text: "some text", type_text: "some type_text", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_text: "some updated_by_text", variant_code: "some variant_code"}
    @update_attrs %{country_code: "some updated country_code", currency_code: "some updated currency_code", currency_symbol: "some updated currency_symbol", decimal_separator: "some updated decimal_separator", grouping_separator: "some updated grouping_separator", language_code: "some updated language_code", quotation_start_delimiter: "some updated quotation_start_delimiter", quotation_stop_delimiter: "some updated quotation_stop_delimiter", region_code: "some updated region_code", script_code: "some updated script_code", state_text: "some updated state_text", state_uri: "some updated state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960668", text: "some updated text", type_text: "some updated type_text", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_text: "some updated updated_by_text", variant_code: "some updated variant_code"}
    @invalid_attrs %{country_code: nil, currency_code: nil, currency_symbol: nil, decimal_separator: nil, grouping_separator: nil, language_code: nil, quotation_start_delimiter: nil, quotation_stop_delimiter: nil, region_code: nil, script_code: nil, state_text: nil, state_uri: nil, tenant_id: nil, text: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil, variant_code: nil}

    def locale_fixture(attrs \\ %{}) do
      {:ok, locale} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Data.create_locale()

      locale
    end

    test "list_locales/0 returns all locales" do
      locale = locale_fixture()
      assert Data.list_locales() == [locale]
    end

    test "get_locale!/1 returns the locale with given id" do
      locale = locale_fixture()
      assert Data.get_locale!(locale.id) == locale
    end

    test "create_locale/1 with valid data creates a locale" do
      assert {:ok, %Locale{} = locale} = Data.create_locale(@valid_attrs)
      assert locale.country_code == "some country_code"
      assert locale.currency_code == "some currency_code"
      assert locale.currency_symbol == "some currency_symbol"
      assert locale.decimal_separator == "some decimal_separator"
      assert locale.grouping_separator == "some grouping_separator"
      assert locale.language_code == "some language_code"
      assert locale.quotation_start_delimiter == "some quotation_start_delimiter"
      assert locale.quotation_stop_delimiter == "some quotation_stop_delimiter"
      assert locale.region_code == "some region_code"
      assert locale.script_code == "some script_code"
      assert locale.state_text == "some state_text"
      assert locale.state_uri == "some state_uri"
      assert locale.tenant_id == "7488a646-e31f-11e4-aace-600308960662"
      assert locale.text == "some text"
      assert locale.type_text == "some type_text"
      assert locale.type_uri == "some type_uri"
      assert locale.updated_at_clock_count == 42
      assert locale.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert locale.updated_by_text == "some updated_by_text"
      assert locale.variant_code == "some variant_code"
    end

    test "create_locale/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_locale(@invalid_attrs)
    end

    test "update_locale/2 with valid data updates the locale" do
      locale = locale_fixture()
      assert {:ok, %Locale{} = locale} = Data.update_locale(locale, @update_attrs)
      assert locale.country_code == "some updated country_code"
      assert locale.currency_code == "some updated currency_code"
      assert locale.currency_symbol == "some updated currency_symbol"
      assert locale.decimal_separator == "some updated decimal_separator"
      assert locale.grouping_separator == "some updated grouping_separator"
      assert locale.language_code == "some updated language_code"
      assert locale.quotation_start_delimiter == "some updated quotation_start_delimiter"
      assert locale.quotation_stop_delimiter == "some updated quotation_stop_delimiter"
      assert locale.region_code == "some updated region_code"
      assert locale.script_code == "some updated script_code"
      assert locale.state_text == "some updated state_text"
      assert locale.state_uri == "some updated state_uri"
      assert locale.tenant_id == "7488a646-e31f-11e4-aace-600308960668"
      assert locale.text == "some updated text"
      assert locale.type_text == "some updated type_text"
      assert locale.type_uri == "some updated type_uri"
      assert locale.updated_at_clock_count == 43
      assert locale.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert locale.updated_by_text == "some updated updated_by_text"
      assert locale.variant_code == "some updated variant_code"
    end

    test "update_locale/2 with invalid data returns error changeset" do
      locale = locale_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_locale(locale, @invalid_attrs)
      assert locale == Data.get_locale!(locale.id)
    end

    test "delete_locale/1 deletes the locale" do
      locale = locale_fixture()
      assert {:ok, %Locale{}} = Data.delete_locale(locale)
      assert_raise Ecto.NoResultsError, fn -> Data.get_locale!(locale.id) end
    end

    test "change_locale/1 returns a locale changeset" do
      locale = locale_fixture()
      assert %Ecto.Changeset{} = Data.change_locale(locale)
    end
  end

  describe "units" do
    alias Contact.Data.Unit

    @valid_attrs %{name: "some name", state_text: "some state_text", state_uri: "some state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960662", type_text: "some type_text", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_text: "some updated_by_text"}
    @update_attrs %{name: "some updated name", state_text: "some updated state_text", state_uri: "some updated state_uri", tenant_id: "7488a646-e31f-11e4-aace-600308960668", type_text: "some updated type_text", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_text: "some updated updated_by_text"}
    @invalid_attrs %{name: nil, state_text: nil, state_uri: nil, tenant_id: nil, type_text: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_text: nil}

    def unit_fixture(attrs \\ %{}) do
      {:ok, unit} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Data.create_unit()

      unit
    end

    test "list_units/0 returns all units" do
      unit = unit_fixture()
      assert Data.list_units() == [unit]
    end

    test "get_unit!/1 returns the unit with given id" do
      unit = unit_fixture()
      assert Data.get_unit!(unit.id) == unit
    end

    test "create_unit/1 with valid data creates a unit" do
      assert {:ok, %Unit{} = unit} = Data.create_unit(@valid_attrs)
      assert unit.name == "some name"
      assert unit.state_text == "some state_text"
      assert unit.state_uri == "some state_uri"
      assert unit.tenant_id == "7488a646-e31f-11e4-aace-600308960662"
      assert unit.type_text == "some type_text"
      assert unit.type_uri == "some type_uri"
      assert unit.updated_at_clock_count == 42
      assert unit.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert unit.updated_by_text == "some updated_by_text"
    end

    test "create_unit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_unit(@invalid_attrs)
    end

    test "update_unit/2 with valid data updates the unit" do
      unit = unit_fixture()
      assert {:ok, %Unit{} = unit} = Data.update_unit(unit, @update_attrs)
      assert unit.name == "some updated name"
      assert unit.state_text == "some updated state_text"
      assert unit.state_uri == "some updated state_uri"
      assert unit.tenant_id == "7488a646-e31f-11e4-aace-600308960668"
      assert unit.type_text == "some updated type_text"
      assert unit.type_uri == "some updated type_uri"
      assert unit.updated_at_clock_count == 43
      assert unit.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert unit.updated_by_text == "some updated updated_by_text"
    end

    test "update_unit/2 with invalid data returns error changeset" do
      unit = unit_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_unit(unit, @invalid_attrs)
      assert unit == Data.get_unit!(unit.id)
    end

    test "delete_unit/1 deletes the unit" do
      unit = unit_fixture()
      assert {:ok, %Unit{}} = Data.delete_unit(unit)
      assert_raise Ecto.NoResultsError, fn -> Data.get_unit!(unit.id) end
    end

    test "change_unit/1 returns a unit changeset" do
      unit = unit_fixture()
      assert %Ecto.Changeset{} = Data.change_unit(unit)
    end
  end
end
