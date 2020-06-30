defmodule Contact.Geo.GeoPoint do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "geo_points" do
    field :altitude_agl_as_meters, :decimal
    field :altitude_msl_as_meters, :decimal
    field :created_at_clock_count, :integer
    field :created_at_timestamp_utc, :naive_datetime
    field :elevation_agl_as_meters, :decimal
    field :elevation_msl_as_meters, :decimal
    field :latitude_as_decimal_degrees, :decimal
    field :longitude_as_decimal_degrees, :decimal
    field :state_uri, :string
    field :tenant_uri, :string
    field :type_uri, :string
    field :updated_at_clock_count, :integer
    field :updated_at_timestamp_utc, :naive_datetime
    field :updated_by_uri, :string

    timestamps()
  end

  @doc false
  def changeset(geo_point, attrs) do
    geo_point
    |> cast(attrs, [:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :latitude_as_decimal_degrees, :longitude_as_decimal_degrees, :altitude_agl_as_meters, :altitude_msl_as_meters, :elevation_agl_as_meters, :elevation_msl_as_meters])
    |> validate_required([:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :latitude_as_decimal_degrees, :longitude_as_decimal_degrees, :altitude_agl_as_meters, :altitude_msl_as_meters, :elevation_agl_as_meters, :elevation_msl_as_meters])
  end
end
