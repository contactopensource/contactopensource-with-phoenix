defmodule Contact.Repo.Migrations.CreateFiles do
  use Ecto.Migration

  def change do
    create table(:files, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :created_at_timestamp_utc, :naive_datetime
      add :created_at_clock_count, :integer
      add :updated_at_timestamp_utc, :naive_datetime
      add :updated_at_clock_count, :integer
      add :updated_by_uri, :text
      add :tenant_uri, :text
      add :type_uri, :text
      add :state_uri, :text
      add :locale_id, :uuid
      add :media_type_id, :uuid
      add :codec_id, :uuid
      add :title, :text
      add :subtitle, :text
      add :summary, :text
      add :saga, :text

      timestamps()
    end

  end
end
