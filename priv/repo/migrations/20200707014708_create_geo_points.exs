defmodule Contact.Repo.Migrations.CreateGeoPoints do
  use Ecto.Migration

  def change do
    create table(:geo_points, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :created_at_timestamp_utc, :naive_datetime
      add :created_at_clock_count, :integer
      add :updated_at_timestamp_utc, :naive_datetime
      add :updated_at_clock_count, :integer
      add :updated_by_uri, :text
      add :tenant_uri, :text
      add :type_uri, :text
      add :state_uri, :text
      add :latitude_as_decimal_degrees, :decimal
      add :longitude_as_decimal_degrees, :decimal
      add :altitude_agl_as_meters, :decimal
      add :altitude_msl_as_meters, :decimal
      add :elevation_agl_as_meters, :decimal
      add :elevation_msl_as_meters, :decimal

      timestamps()
    end

  end
end
