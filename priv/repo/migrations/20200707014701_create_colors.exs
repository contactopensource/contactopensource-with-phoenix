defmodule Contact.Repo.Migrations.CreateColors do
  use Ecto.Migration

  def change do
    create table(:colors, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :created_at_timestamp_utc, :naive_datetime
      add :created_at_clock_count, :integer
      add :updated_at_timestamp_utc, :naive_datetime
      add :updated_at_clock_count, :integer
      add :updated_by_uri, :text
      add :tenant_uri, :text
      add :type_uri, :text
      add :state_uri, :text
      add :rgb_unit_interval_r, :decimal
      add :rgb_unit_interval_g, :decimal
      add :rgb_unit_interval_b, :decimal
      add :cymk_unit_interval_c, :decimal
      add :cymk_unit_interval_y, :decimal
      add :cymk_unit_interval_m, :decimal
      add :cymk_unit_interval_k, :decimal
      add :hex, :text
      add :html_color_name, :text
      add :x11_color_name, :text
      add :color_naming_system_name, :text
      add :pantone_matching_system_name, :text

      timestamps()
    end

  end
end
