defmodule Contact.GeoTest do
  use Contact.DataCase

  alias Contact.Geo

  describe "geo_points" do
    alias Contact.Geo.GeoPoint

    @valid_attrs %{altitude_agl_as_meters: "120.5", altitude_msl_as_meters: "120.5", created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], elevation_agl_as_meters: "120.5", elevation_msl_as_meters: "120.5", latitude_as_decimal_degrees: "120.5", longitude_as_decimal_degrees: "120.5", state_uri: "some state_uri", tenant_uri: "some tenant_uri", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
    @update_attrs %{altitude_agl_as_meters: "456.7", altitude_msl_as_meters: "456.7", created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], elevation_agl_as_meters: "456.7", elevation_msl_as_meters: "456.7", latitude_as_decimal_degrees: "456.7", longitude_as_decimal_degrees: "456.7", state_uri: "some updated state_uri", tenant_uri: "some updated tenant_uri", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
    @invalid_attrs %{altitude_agl_as_meters: nil, altitude_msl_as_meters: nil, created_at_clock_count: nil, created_at_timestamp_utc: nil, elevation_agl_as_meters: nil, elevation_msl_as_meters: nil, latitude_as_decimal_degrees: nil, longitude_as_decimal_degrees: nil, state_uri: nil, tenant_uri: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

    def geo_point_fixture(attrs \\ %{}) do
      {:ok, geo_point} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Geo.create_geo_point()

      geo_point
    end

    test "list_geo_points/0 returns all geo_points" do
      geo_point = geo_point_fixture()
      assert Geo.list_geo_points() == [geo_point]
    end

    test "get_geo_point!/1 returns the geo_point with given id" do
      geo_point = geo_point_fixture()
      assert Geo.get_geo_point!(geo_point.id) == geo_point
    end

    test "create_geo_point/1 with valid data creates a geo_point" do
      assert {:ok, %GeoPoint{} = geo_point} = Geo.create_geo_point(@valid_attrs)
      assert geo_point.altitude_agl_as_meters == Decimal.new("120.5")
      assert geo_point.altitude_msl_as_meters == Decimal.new("120.5")
      assert geo_point.created_at_clock_count == 42
      assert geo_point.created_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert geo_point.elevation_agl_as_meters == Decimal.new("120.5")
      assert geo_point.elevation_msl_as_meters == Decimal.new("120.5")
      assert geo_point.latitude_as_decimal_degrees == Decimal.new("120.5")
      assert geo_point.longitude_as_decimal_degrees == Decimal.new("120.5")
      assert geo_point.state_uri == "some state_uri"
      assert geo_point.tenant_uri == "some tenant_uri"
      assert geo_point.type_uri == "some type_uri"
      assert geo_point.updated_at_clock_count == 42
      assert geo_point.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert geo_point.updated_by_uri == "some updated_by_uri"
    end

    test "create_geo_point/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Geo.create_geo_point(@invalid_attrs)
    end

    test "update_geo_point/2 with valid data updates the geo_point" do
      geo_point = geo_point_fixture()
      assert {:ok, %GeoPoint{} = geo_point} = Geo.update_geo_point(geo_point, @update_attrs)
      assert geo_point.altitude_agl_as_meters == Decimal.new("456.7")
      assert geo_point.altitude_msl_as_meters == Decimal.new("456.7")
      assert geo_point.created_at_clock_count == 43
      assert geo_point.created_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert geo_point.elevation_agl_as_meters == Decimal.new("456.7")
      assert geo_point.elevation_msl_as_meters == Decimal.new("456.7")
      assert geo_point.latitude_as_decimal_degrees == Decimal.new("456.7")
      assert geo_point.longitude_as_decimal_degrees == Decimal.new("456.7")
      assert geo_point.state_uri == "some updated state_uri"
      assert geo_point.tenant_uri == "some updated tenant_uri"
      assert geo_point.type_uri == "some updated type_uri"
      assert geo_point.updated_at_clock_count == 43
      assert geo_point.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert geo_point.updated_by_uri == "some updated updated_by_uri"
    end

    test "update_geo_point/2 with invalid data returns error changeset" do
      geo_point = geo_point_fixture()
      assert {:error, %Ecto.Changeset{}} = Geo.update_geo_point(geo_point, @invalid_attrs)
      assert geo_point == Geo.get_geo_point!(geo_point.id)
    end

    test "delete_geo_point/1 deletes the geo_point" do
      geo_point = geo_point_fixture()
      assert {:ok, %GeoPoint{}} = Geo.delete_geo_point(geo_point)
      assert_raise Ecto.NoResultsError, fn -> Geo.get_geo_point!(geo_point.id) end
    end

    test "change_geo_point/1 returns a geo_point changeset" do
      geo_point = geo_point_fixture()
      assert %Ecto.Changeset{} = Geo.change_geo_point(geo_point)
    end
  end

  describe "geo_centers" do
    alias Contact.Geo.GeoCenter

    @valid_attrs %{center_as_geo_point_id: "7488a646-e31f-11e4-aace-600308960662", created_at_clock_count: 42, created_at_timestamp_utc: ~N[2010-04-17 14:00:00], spread_as_meters: "120.5", state_uri: "some state_uri", tenant_uri: "some tenant_uri", type_uri: "some type_uri", updated_at_clock_count: 42, updated_at_timestamp_utc: ~N[2010-04-17 14:00:00], updated_by_uri: "some updated_by_uri"}
    @update_attrs %{center_as_geo_point_id: "7488a646-e31f-11e4-aace-600308960668", created_at_clock_count: 43, created_at_timestamp_utc: ~N[2011-05-18 15:01:01], spread_as_meters: "456.7", state_uri: "some updated state_uri", tenant_uri: "some updated tenant_uri", type_uri: "some updated type_uri", updated_at_clock_count: 43, updated_at_timestamp_utc: ~N[2011-05-18 15:01:01], updated_by_uri: "some updated updated_by_uri"}
    @invalid_attrs %{center_as_geo_point_id: nil, created_at_clock_count: nil, created_at_timestamp_utc: nil, spread_as_meters: nil, state_uri: nil, tenant_uri: nil, type_uri: nil, updated_at_clock_count: nil, updated_at_timestamp_utc: nil, updated_by_uri: nil}

    def geo_center_fixture(attrs \\ %{}) do
      {:ok, geo_center} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Geo.create_geo_center()

      geo_center
    end

    test "list_geo_centers/0 returns all geo_centers" do
      geo_center = geo_center_fixture()
      assert Geo.list_geo_centers() == [geo_center]
    end

    test "get_geo_center!/1 returns the geo_center with given id" do
      geo_center = geo_center_fixture()
      assert Geo.get_geo_center!(geo_center.id) == geo_center
    end

    test "create_geo_center/1 with valid data creates a geo_center" do
      assert {:ok, %GeoCenter{} = geo_center} = Geo.create_geo_center(@valid_attrs)
      assert geo_center.center_as_geo_point_id == "7488a646-e31f-11e4-aace-600308960662"
      assert geo_center.created_at_clock_count == 42
      assert geo_center.created_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert geo_center.spread_as_meters == Decimal.new("120.5")
      assert geo_center.state_uri == "some state_uri"
      assert geo_center.tenant_uri == "some tenant_uri"
      assert geo_center.type_uri == "some type_uri"
      assert geo_center.updated_at_clock_count == 42
      assert geo_center.updated_at_timestamp_utc == ~N[2010-04-17 14:00:00]
      assert geo_center.updated_by_uri == "some updated_by_uri"
    end

    test "create_geo_center/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Geo.create_geo_center(@invalid_attrs)
    end

    test "update_geo_center/2 with valid data updates the geo_center" do
      geo_center = geo_center_fixture()
      assert {:ok, %GeoCenter{} = geo_center} = Geo.update_geo_center(geo_center, @update_attrs)
      assert geo_center.center_as_geo_point_id == "7488a646-e31f-11e4-aace-600308960668"
      assert geo_center.created_at_clock_count == 43
      assert geo_center.created_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert geo_center.spread_as_meters == Decimal.new("456.7")
      assert geo_center.state_uri == "some updated state_uri"
      assert geo_center.tenant_uri == "some updated tenant_uri"
      assert geo_center.type_uri == "some updated type_uri"
      assert geo_center.updated_at_clock_count == 43
      assert geo_center.updated_at_timestamp_utc == ~N[2011-05-18 15:01:01]
      assert geo_center.updated_by_uri == "some updated updated_by_uri"
    end

    test "update_geo_center/2 with invalid data returns error changeset" do
      geo_center = geo_center_fixture()
      assert {:error, %Ecto.Changeset{}} = Geo.update_geo_center(geo_center, @invalid_attrs)
      assert geo_center == Geo.get_geo_center!(geo_center.id)
    end

    test "delete_geo_center/1 deletes the geo_center" do
      geo_center = geo_center_fixture()
      assert {:ok, %GeoCenter{}} = Geo.delete_geo_center(geo_center)
      assert_raise Ecto.NoResultsError, fn -> Geo.get_geo_center!(geo_center.id) end
    end

    test "change_geo_center/1 returns a geo_center changeset" do
      geo_center = geo_center_fixture()
      assert %Ecto.Changeset{} = Geo.change_geo_center(geo_center)
    end
  end
end
