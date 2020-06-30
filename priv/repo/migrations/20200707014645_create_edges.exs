defmodule Contact.Repo.Migrations.CreateEdges do
  use Ecto.Migration

  def change do
    create table(:edges, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :created_at_timestamp_utc, :naive_datetime
      add :created_at_clock_count, :integer
      add :updated_at_timestamp_utc, :naive_datetime
      add :updated_at_clock_count, :integer
      add :updated_by_uri, :text
      add :tenant_uri, :text
      add :type_uri, :text
      add :state_uri, :text
      add :subject_uri, :text
      add :subject_database, :text
      add :subject_schema, :text
      add :subject_table, :text
      add :subject_id, :uuid
      add :predicate_uri, :text
      add :predicate_database, :text
      add :predicate_schema, :text
      add :predicate_table, :text
      add :predicate_id, :uuid
      add :object_uri, :text
      add :object_database, :text
      add :object_schema, :text
      add :object_table, :text
      add :object_id, :uuid
      add :start_at_timestamp_utc, :naive_datetime
      add :stop_at_timestamp_utc, :naive_datetime
      add :count, :integer
      add :weight, :decimal
      add :probability, :decimal

      timestamps()
    end

  end
end
