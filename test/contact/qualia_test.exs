defmodule Contact.QualiaTest do
  use Contact.DataCase

  alias Contact.Qualia

  describe "colors" do
    alias Contact.Qualia.Color

    @valid_attrs %{color_naming_system_name: "some color_naming_system_name", cymk_unit_interval_c: "120.5", cymk_unit_interval_k: "120.5", cymk_unit_interval_m: "120.5", cymk_unit_interval_y: "120.5", hex: "some hex", html_color_name: "some html_color_name", pantone_matching_system_name: "some pantone_matching_system_name", rgb_unit_interval_b: "120.5", rgb_unit_interval_g: "120.5", rgb_unit_interval_r: "120.5", state_uri: "some state_uri", tenant_uri: "some tenant_uri", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri", x11_color_name: "some x11_color_name"}
    @update_attrs %{color_naming_system_name: "some updated color_naming_system_name", cymk_unit_interval_c: "456.7", cymk_unit_interval_k: "456.7", cymk_unit_interval_m: "456.7", cymk_unit_interval_y: "456.7", hex: "some updated hex", html_color_name: "some updated html_color_name", pantone_matching_system_name: "some updated pantone_matching_system_name", rgb_unit_interval_b: "456.7", rgb_unit_interval_g: "456.7", rgb_unit_interval_r: "456.7", state_uri: "some updated state_uri", tenant_uri: "some updated tenant_uri", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri", x11_color_name: "some updated x11_color_name"}
    @invalid_attrs %{color_naming_system_name: nil, cymk_unit_interval_c: nil, cymk_unit_interval_k: nil, cymk_unit_interval_m: nil, cymk_unit_interval_y: nil, hex: nil, html_color_name: nil, pantone_matching_system_name: nil, rgb_unit_interval_b: nil, rgb_unit_interval_g: nil, rgb_unit_interval_r: nil, state_uri: nil, tenant_uri: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil, x11_color_name: nil}

    def color_fixture(attrs \\ %{}) do
      {:ok, color} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Qualia.create_color()

      color
    end

    test "list_colors/0 returns all colors" do
      color = color_fixture()
      assert Qualia.list_colors() == [color]
    end

    test "get_color!/1 returns the color with given id" do
      color = color_fixture()
      assert Qualia.get_color!(color.id) == color
    end

    test "create_color/1 with valid data creates a color" do
      assert {:ok, %Color{} = color} = Qualia.create_color(@valid_attrs)
      assert color.color_naming_system_name == "some color_naming_system_name"
      assert color.cymk_unit_interval_c == Decimal.new("120.5")
      assert color.cymk_unit_interval_k == Decimal.new("120.5")
      assert color.cymk_unit_interval_m == Decimal.new("120.5")
      assert color.cymk_unit_interval_y == Decimal.new("120.5")
      assert color.hex == "some hex"
      assert color.html_color_name == "some html_color_name"
      assert color.pantone_matching_system_name == "some pantone_matching_system_name"
      assert color.rgb_unit_interval_b == Decimal.new("120.5")
      assert color.rgb_unit_interval_g == Decimal.new("120.5")
      assert color.rgb_unit_interval_r == Decimal.new("120.5")
      assert color.state_uri == "some state_uri"
      assert color.tenant_uri == "some tenant_uri"
      assert color.type_uri == "some type_uri"
      assert color.updated_at_clock_count == 42
      assert color.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert color.updated_by_uri == "some updated_by_uri"
      assert color.x11_color_name == "some x11_color_name"
    end

    test "create_color/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Qualia.create_color(@invalid_attrs)
    end

    test "update_color/2 with valid data updates the color" do
      color = color_fixture()
      assert {:ok, %Color{} = color} = Qualia.update_color(color, @update_attrs)
      assert color.color_naming_system_name == "some updated color_naming_system_name"
      assert color.cymk_unit_interval_c == Decimal.new("456.7")
      assert color.cymk_unit_interval_k == Decimal.new("456.7")
      assert color.cymk_unit_interval_m == Decimal.new("456.7")
      assert color.cymk_unit_interval_y == Decimal.new("456.7")
      assert color.hex == "some updated hex"
      assert color.html_color_name == "some updated html_color_name"
      assert color.pantone_matching_system_name == "some updated pantone_matching_system_name"
      assert color.rgb_unit_interval_b == Decimal.new("456.7")
      assert color.rgb_unit_interval_g == Decimal.new("456.7")
      assert color.rgb_unit_interval_r == Decimal.new("456.7")
      assert color.state_uri == "some updated state_uri"
      assert color.tenant_uri == "some updated tenant_uri"
      assert color.type_uri == "some updated type_uri"
      assert color.updated_at_clock_count == 43
      assert color.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert color.updated_by_uri == "some updated updated_by_uri"
      assert color.x11_color_name == "some updated x11_color_name"
    end

    test "update_color/2 with invalid data returns error changeset" do
      color = color_fixture()
      assert {:error, %Ecto.Changeset{}} = Qualia.update_color(color, @invalid_attrs)
      assert color == Qualia.get_color!(color.id)
    end

    test "delete_color/1 deletes the color" do
      color = color_fixture()
      assert {:ok, %Color{}} = Qualia.delete_color(color)
      assert_raise Ecto.NoResultsError, fn -> Qualia.get_color!(color.id) end
    end

    test "change_color/1 returns a color changeset" do
      color = color_fixture()
      assert %Ecto.Changeset{} = Qualia.change_color(color)
    end
  end

  describe "color_themes" do
    alias Contact.Qualia.ColorTheme

    @valid_attrs %{caution_color_id: "7488a646-e31f-11e4-aace-600308960662", danger_color_id: "7488a646-e31f-11e4-aace-600308960662", dark_color_id: "7488a646-e31f-11e4-aace-600308960662", failure_color_id: "7488a646-e31f-11e4-aace-600308960662", light_color_id: "7488a646-e31f-11e4-aace-600308960662", primary_color_id: "7488a646-e31f-11e4-aace-600308960662", rag_status_a_color_id: "7488a646-e31f-11e4-aace-600308960662", rag_status_g_color_id: "7488a646-e31f-11e4-aace-600308960662", rag_status_r_color_id: "7488a646-e31f-11e4-aace-600308960662", safety_color_id: "7488a646-e31f-11e4-aace-600308960662", secondary_color_id: "7488a646-e31f-11e4-aace-600308960662", state_uri: "some state_uri", success_color_id: "7488a646-e31f-11e4-aace-600308960662", tenant_uri: "some tenant_uri", tertiary_color_id: "7488a646-e31f-11e4-aace-600308960662", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri", warning_color_id: "7488a646-e31f-11e4-aace-600308960662"}
    @update_attrs %{caution_color_id: "7488a646-e31f-11e4-aace-600308960668", danger_color_id: "7488a646-e31f-11e4-aace-600308960668", dark_color_id: "7488a646-e31f-11e4-aace-600308960668", failure_color_id: "7488a646-e31f-11e4-aace-600308960668", light_color_id: "7488a646-e31f-11e4-aace-600308960668", primary_color_id: "7488a646-e31f-11e4-aace-600308960668", rag_status_a_color_id: "7488a646-e31f-11e4-aace-600308960668", rag_status_g_color_id: "7488a646-e31f-11e4-aace-600308960668", rag_status_r_color_id: "7488a646-e31f-11e4-aace-600308960668", safety_color_id: "7488a646-e31f-11e4-aace-600308960668", secondary_color_id: "7488a646-e31f-11e4-aace-600308960668", state_uri: "some updated state_uri", success_color_id: "7488a646-e31f-11e4-aace-600308960668", tenant_uri: "some updated tenant_uri", tertiary_color_id: "7488a646-e31f-11e4-aace-600308960668", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri", warning_color_id: "7488a646-e31f-11e4-aace-600308960668"}
    @invalid_attrs %{caution_color_id: nil, danger_color_id: nil, dark_color_id: nil, failure_color_id: nil, light_color_id: nil, primary_color_id: nil, rag_status_a_color_id: nil, rag_status_g_color_id: nil, rag_status_r_color_id: nil, safety_color_id: nil, secondary_color_id: nil, state_uri: nil, success_color_id: nil, tenant_uri: nil, tertiary_color_id: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil, warning_color_id: nil}

    def color_theme_fixture(attrs \\ %{}) do
      {:ok, color_theme} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Qualia.create_color_theme()

      color_theme
    end

    test "list_color_themes/0 returns all color_themes" do
      color_theme = color_theme_fixture()
      assert Qualia.list_color_themes() == [color_theme]
    end

    test "get_color_theme!/1 returns the color_theme with given id" do
      color_theme = color_theme_fixture()
      assert Qualia.get_color_theme!(color_theme.id) == color_theme
    end

    test "create_color_theme/1 with valid data creates a color_theme" do
      assert {:ok, %ColorTheme{} = color_theme} = Qualia.create_color_theme(@valid_attrs)
      assert color_theme.caution_color_id == "7488a646-e31f-11e4-aace-600308960662"
      assert color_theme.danger_color_id == "7488a646-e31f-11e4-aace-600308960662"
      assert color_theme.dark_color_id == "7488a646-e31f-11e4-aace-600308960662"
      assert color_theme.failure_color_id == "7488a646-e31f-11e4-aace-600308960662"
      assert color_theme.light_color_id == "7488a646-e31f-11e4-aace-600308960662"
      assert color_theme.primary_color_id == "7488a646-e31f-11e4-aace-600308960662"
      assert color_theme.rag_status_a_color_id == "7488a646-e31f-11e4-aace-600308960662"
      assert color_theme.rag_status_g_color_id == "7488a646-e31f-11e4-aace-600308960662"
      assert color_theme.rag_status_r_color_id == "7488a646-e31f-11e4-aace-600308960662"
      assert color_theme.safety_color_id == "7488a646-e31f-11e4-aace-600308960662"
      assert color_theme.secondary_color_id == "7488a646-e31f-11e4-aace-600308960662"
      assert color_theme.state_uri == "some state_uri"
      assert color_theme.success_color_id == "7488a646-e31f-11e4-aace-600308960662"
      assert color_theme.tenant_uri == "some tenant_uri"
      assert color_theme.tertiary_color_id == "7488a646-e31f-11e4-aace-600308960662"
      assert color_theme.type_uri == "some type_uri"
      assert color_theme.updated_at_clock_count == 42
      assert color_theme.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert color_theme.updated_by_uri == "some updated_by_uri"
      assert color_theme.warning_color_id == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_color_theme/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Qualia.create_color_theme(@invalid_attrs)
    end

    test "update_color_theme/2 with valid data updates the color_theme" do
      color_theme = color_theme_fixture()
      assert {:ok, %ColorTheme{} = color_theme} = Qualia.update_color_theme(color_theme, @update_attrs)
      assert color_theme.caution_color_id == "7488a646-e31f-11e4-aace-600308960668"
      assert color_theme.danger_color_id == "7488a646-e31f-11e4-aace-600308960668"
      assert color_theme.dark_color_id == "7488a646-e31f-11e4-aace-600308960668"
      assert color_theme.failure_color_id == "7488a646-e31f-11e4-aace-600308960668"
      assert color_theme.light_color_id == "7488a646-e31f-11e4-aace-600308960668"
      assert color_theme.primary_color_id == "7488a646-e31f-11e4-aace-600308960668"
      assert color_theme.rag_status_a_color_id == "7488a646-e31f-11e4-aace-600308960668"
      assert color_theme.rag_status_g_color_id == "7488a646-e31f-11e4-aace-600308960668"
      assert color_theme.rag_status_r_color_id == "7488a646-e31f-11e4-aace-600308960668"
      assert color_theme.safety_color_id == "7488a646-e31f-11e4-aace-600308960668"
      assert color_theme.secondary_color_id == "7488a646-e31f-11e4-aace-600308960668"
      assert color_theme.state_uri == "some updated state_uri"
      assert color_theme.success_color_id == "7488a646-e31f-11e4-aace-600308960668"
      assert color_theme.tenant_uri == "some updated tenant_uri"
      assert color_theme.tertiary_color_id == "7488a646-e31f-11e4-aace-600308960668"
      assert color_theme.type_uri == "some updated type_uri"
      assert color_theme.updated_at_clock_count == 43
      assert color_theme.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert color_theme.updated_by_uri == "some updated updated_by_uri"
      assert color_theme.warning_color_id == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_color_theme/2 with invalid data returns error changeset" do
      color_theme = color_theme_fixture()
      assert {:error, %Ecto.Changeset{}} = Qualia.update_color_theme(color_theme, @invalid_attrs)
      assert color_theme == Qualia.get_color_theme!(color_theme.id)
    end

    test "delete_color_theme/1 deletes the color_theme" do
      color_theme = color_theme_fixture()
      assert {:ok, %ColorTheme{}} = Qualia.delete_color_theme(color_theme)
      assert_raise Ecto.NoResultsError, fn -> Qualia.get_color_theme!(color_theme.id) end
    end

    test "change_color_theme/1 returns a color_theme changeset" do
      color_theme = color_theme_fixture()
      assert %Ecto.Changeset{} = Qualia.change_color_theme(color_theme)
    end
  end
end
