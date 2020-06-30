defmodule Contact.Geo.GeoCenter do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "geo_centers" do
    field :center_as_geo_point_id, Ecto.UUID
    field :created_at_clock_count, :integer
    field :created_at_timestamp_utc, :naive_datetime
    field :spread_as_meters, :decimal
    field :state_uri, :string
    field :tenant_uri, :string
    field :type_uri, :string
    field :updated_at_clock_count, :integer
    field :updated_at_timestamp_utc, :naive_datetime
    field :updated_by_uri, :string

    timestamps()
  end

  @doc false
  def changeset(geo_center, attrs) do
    geo_center
    |> cast(attrs, [:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :center_as_geo_point_id, :spread_as_meters])
    |> validate_required([:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :center_as_geo_point_id, :spread_as_meters])
  end
end
