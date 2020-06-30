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

  describe "media_types" do
    alias Contact.Data.MediaType

    @valid_attrs %{created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], parameter_text: "some parameter_text", state_uri: "some state_uri", subtype: "some subtype", suffix: "some suffix", supertype: "some supertype", tenant_uri: "some tenant_uri", text: "some text", tree: "some tree", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
    @update_attrs %{created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], parameter_text: "some updated parameter_text", state_uri: "some updated state_uri", subtype: "some updated subtype", suffix: "some updated suffix", supertype: "some updated supertype", tenant_uri: "some updated tenant_uri", text: "some updated text", tree: "some updated tree", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
    @invalid_attrs %{created_at_clock_count: nil, created_at_timestamp_utc: nil, parameter_text: nil, state_uri: nil, subtype: nil, suffix: nil, supertype: nil, tenant_uri: nil, text: nil, tree: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

    def media_type_fixture(attrs \\ %{}) do
      {:ok, media_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Data.create_media_type()

      media_type
    end

    test "list_media_types/0 returns all media_types" do
      media_type = media_type_fixture()
      assert Data.list_media_types() == [media_type]
    end

    test "get_media_type!/1 returns the media_type with given id" do
      media_type = media_type_fixture()
      assert Data.get_media_type!(media_type.id) == media_type
    end

    test "create_media_type/1 with valid data creates a media_type" do
      assert {:ok, %MediaType{} = media_type} = Data.create_media_type(@valid_attrs)
      assert media_type.created_at_clock_count == 42
      assert media_type.created_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert media_type.parameter_text == "some parameter_text"
      assert media_type.state_uri == "some state_uri"
      assert media_type.subtype == "some subtype"
      assert media_type.suffix == "some suffix"
      assert media_type.supertype == "some supertype"
      assert media_type.tenant_uri == "some tenant_uri"
      assert media_type.text == "some text"
      assert media_type.tree == "some tree"
      assert media_type.type_uri == "some type_uri"
      assert media_type.updated_at_clock_count == 42
      assert media_type.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert media_type.updated_by_uri == "some updated_by_uri"
    end

    test "create_media_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_media_type(@invalid_attrs)
    end

    test "update_media_type/2 with valid data updates the media_type" do
      media_type = media_type_fixture()
      assert {:ok, %MediaType{} = media_type} = Data.update_media_type(media_type, @update_attrs)
      assert media_type.created_at_clock_count == 43
      assert media_type.created_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert media_type.parameter_text == "some updated parameter_text"
      assert media_type.state_uri == "some updated state_uri"
      assert media_type.subtype == "some updated subtype"
      assert media_type.suffix == "some updated suffix"
      assert media_type.supertype == "some updated supertype"
      assert media_type.tenant_uri == "some updated tenant_uri"
      assert media_type.text == "some updated text"
      assert media_type.tree == "some updated tree"
      assert media_type.type_uri == "some updated type_uri"
      assert media_type.updated_at_clock_count == 43
      assert media_type.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert media_type.updated_by_uri == "some updated updated_by_uri"
    end

    test "update_media_type/2 with invalid data returns error changeset" do
      media_type = media_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_media_type(media_type, @invalid_attrs)
      assert media_type == Data.get_media_type!(media_type.id)
    end

    test "delete_media_type/1 deletes the media_type" do
      media_type = media_type_fixture()
      assert {:ok, %MediaType{}} = Data.delete_media_type(media_type)
      assert_raise Ecto.NoResultsError, fn -> Data.get_media_type!(media_type.id) end
    end

    test "change_media_type/1 returns a media_type changeset" do
      media_type = media_type_fixture()
      assert %Ecto.Changeset{} = Data.change_media_type(media_type)
    end
  end

  describe "codecs" do
    alias Contact.Data.Codec

    @valid_attrs %{bit_rate: "120.5", bit_rate_maximum: "120.5", bit_rate_minimum: "120.5", channel_count: 42, channel_count_maximum: 42, channel_count_minimum: 42, code: "some code", created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], creator_name: "some creator_name", floss_flag: true, icon: "some icon", link: "some link", lossy_flag: true, name: "some name", note: "some note", parent_id: "7488a646-e31f-11e4-aace-600308960662", prefer_file_extension: "some prefer_file_extension", prefer_media_type_id: "7488a646-e31f-11e4-aace-600308960662", set_id: "7488a646-e31f-11e4-aace-600308960662", state_uri: "some state_uri", tenant_uri: "some tenant_uri", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri", variable_bit_rate_flag: true, variable_channel_count_flag: true}
    @update_attrs %{bit_rate: "456.7", bit_rate_maximum: "456.7", bit_rate_minimum: "456.7", channel_count: 43, channel_count_maximum: 43, channel_count_minimum: 43, code: "some updated code", created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], creator_name: "some updated creator_name", floss_flag: false, icon: "some updated icon", link: "some updated link", lossy_flag: false, name: "some updated name", note: "some updated note", parent_id: "7488a646-e31f-11e4-aace-600308960668", prefer_file_extension: "some updated prefer_file_extension", prefer_media_type_id: "7488a646-e31f-11e4-aace-600308960668", set_id: "7488a646-e31f-11e4-aace-600308960668", state_uri: "some updated state_uri", tenant_uri: "some updated tenant_uri", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri", variable_bit_rate_flag: false, variable_channel_count_flag: false}
    @invalid_attrs %{bit_rate: nil, bit_rate_maximum: nil, bit_rate_minimum: nil, channel_count: nil, channel_count_maximum: nil, channel_count_minimum: nil, code: nil, created_at_clock_count: nil, created_at_timestamp_utc: nil, creator_name: nil, floss_flag: nil, icon: nil, link: nil, lossy_flag: nil, name: nil, note: nil, parent_id: nil, prefer_file_extension: nil, prefer_media_type_id: nil, set_id: nil, state_uri: nil, tenant_uri: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil, variable_bit_rate_flag: nil, variable_channel_count_flag: nil}

    def codec_fixture(attrs \\ %{}) do
      {:ok, codec} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Data.create_codec()

      codec
    end

    test "list_codecs/0 returns all codecs" do
      codec = codec_fixture()
      assert Data.list_codecs() == [codec]
    end

    test "get_codec!/1 returns the codec with given id" do
      codec = codec_fixture()
      assert Data.get_codec!(codec.id) == codec
    end

    test "create_codec/1 with valid data creates a codec" do
      assert {:ok, %Codec{} = codec} = Data.create_codec(@valid_attrs)
      assert codec.bit_rate == Decimal.new("120.5")
      assert codec.bit_rate_maximum == Decimal.new("120.5")
      assert codec.bit_rate_minimum == Decimal.new("120.5")
      assert codec.channel_count == 42
      assert codec.channel_count_maximum == 42
      assert codec.channel_count_minimum == 42
      assert codec.code == "some code"
      assert codec.created_at_clock_count == 42
      assert codec.created_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert codec.creator_name == "some creator_name"
      assert codec.floss_flag == true
      assert codec.icon == "some icon"
      assert codec.link == "some link"
      assert codec.lossy_flag == true
      assert codec.name == "some name"
      assert codec.note == "some note"
      assert codec.parent_id == "7488a646-e31f-11e4-aace-600308960662"
      assert codec.prefer_file_extension == "some prefer_file_extension"
      assert codec.prefer_media_type_id == "7488a646-e31f-11e4-aace-600308960662"
      assert codec.set_id == "7488a646-e31f-11e4-aace-600308960662"
      assert codec.state_uri == "some state_uri"
      assert codec.tenant_uri == "some tenant_uri"
      assert codec.type_uri == "some type_uri"
      assert codec.updated_at_clock_count == 42
      assert codec.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert codec.updated_by_uri == "some updated_by_uri"
      assert codec.variable_bit_rate_flag == true
      assert codec.variable_channel_count_flag == true
    end

    test "create_codec/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Data.create_codec(@invalid_attrs)
    end

    test "update_codec/2 with valid data updates the codec" do
      codec = codec_fixture()
      assert {:ok, %Codec{} = codec} = Data.update_codec(codec, @update_attrs)
      assert codec.bit_rate == Decimal.new("456.7")
      assert codec.bit_rate_maximum == Decimal.new("456.7")
      assert codec.bit_rate_minimum == Decimal.new("456.7")
      assert codec.channel_count == 43
      assert codec.channel_count_maximum == 43
      assert codec.channel_count_minimum == 43
      assert codec.code == "some updated code"
      assert codec.created_at_clock_count == 43
      assert codec.created_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert codec.creator_name == "some updated creator_name"
      assert codec.floss_flag == false
      assert codec.icon == "some updated icon"
      assert codec.link == "some updated link"
      assert codec.lossy_flag == false
      assert codec.name == "some updated name"
      assert codec.note == "some updated note"
      assert codec.parent_id == "7488a646-e31f-11e4-aace-600308960668"
      assert codec.prefer_file_extension == "some updated prefer_file_extension"
      assert codec.prefer_media_type_id == "7488a646-e31f-11e4-aace-600308960668"
      assert codec.set_id == "7488a646-e31f-11e4-aace-600308960668"
      assert codec.state_uri == "some updated state_uri"
      assert codec.tenant_uri == "some updated tenant_uri"
      assert codec.type_uri == "some updated type_uri"
      assert codec.updated_at_clock_count == 43
      assert codec.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert codec.updated_by_uri == "some updated updated_by_uri"
      assert codec.variable_bit_rate_flag == false
      assert codec.variable_channel_count_flag == false
    end

    test "update_codec/2 with invalid data returns error changeset" do
      codec = codec_fixture()
      assert {:error, %Ecto.Changeset{}} = Data.update_codec(codec, @invalid_attrs)
      assert codec == Data.get_codec!(codec.id)
    end

    test "delete_codec/1 deletes the codec" do
      codec = codec_fixture()
      assert {:ok, %Codec{}} = Data.delete_codec(codec)
      assert_raise Ecto.NoResultsError, fn -> Data.get_codec!(codec.id) end
    end

    test "change_codec/1 returns a codec changeset" do
      codec = codec_fixture()
      assert %Ecto.Changeset{} = Data.change_codec(codec)
    end
  end
end
