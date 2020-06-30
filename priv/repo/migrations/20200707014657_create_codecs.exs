defmodule Contact.Repo.Migrations.CreateCodecs do
  use Ecto.Migration

  def change do
    create table(:codecs, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :created_at_timestamp_utc, :naive_datetime
      add :created_at_clock_count, :integer
      add :updated_at_timestamp_utc, :naive_datetime
      add :updated_at_clock_count, :integer
      add :updated_by_uri, :text
      add :tenant_uri, :text
      add :type_uri, :text
      add :state_uri, :text
      add :set_id, :uuid
      add :parent_id, :uuid
      add :name, :text
      add :code, :text
      add :icon, :text
      add :link, :text
      add :note, :text
      add :creator_name, :text
      add :prefer_file_extension, :text
      add :prefer_media_type_id, :uuid
      add :lossy_flag, :boolean, default: false, null: false
      add :floss_flag, :boolean, default: false, null: false
      add :bit_rate, :decimal
      add :bit_rate_minimum, :decimal
      add :bit_rate_maximum, :decimal
      add :variable_bit_rate_flag, :boolean, default: false, null: false
      add :channel_count, :integer
      add :channel_count_minimum, :integer
      add :channel_count_maximum, :integer
      add :variable_channel_count_flag, :boolean, default: false, null: false

      timestamps()
    end

  end
end
