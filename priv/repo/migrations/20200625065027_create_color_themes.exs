defmodule Contact.Repo.Migrations.CreateColorThemes do
  use Ecto.Migration

  def change do
    create table(:color_themes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :updated_at_timestamp_utc, :naive_datetime
      add :updated_at_clock_count, :integer
      add :updated_by_uri, :text
      add :tenant_uri, :text
      add :type_uri, :text
      add :state_uri, :text
      add :primary_color_id, :uuid
      add :secondary_color_id, :uuid
      add :tertiary_color_id, :uuid
      add :success_color_id, :uuid
      add :failure_color_id, :uuid
      add :light_color_id, :uuid
      add :dark_color_id, :uuid
      add :safety_color_id, :uuid
      add :caution_color_id, :uuid
      add :warning_color_id, :uuid
      add :danger_color_id, :uuid
      add :rag_status_r_color_id, :uuid
      add :rag_status_a_color_id, :uuid
      add :rag_status_g_color_id, :uuid

      timestamps()
    end

  end
end
