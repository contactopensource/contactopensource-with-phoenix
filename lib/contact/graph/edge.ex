defmodule Contact.Graph.Edge do
  use Ecto.Schema
  import Ecto.Changeset

  schema "edges" do
    field :count, :integer
    field :object_database, :string
    field :object_id, Ecto.UUID
    field :object_schema, :string
    field :object_table, :string
    field :object_uri, :string
    field :predicate_database, :string
    field :predicate_id, Ecto.UUID
    field :predicate_schema, :string
    field :predicate_table, :string
    field :predicate_uri, :string
    field :unit_interval, :decimal
    field :dual_interval, :decimal
    field :start_at_timestamp_utc, :naive_datetime
    field :state_text, :string
    field :state_uri, :string
    field :stop_at_timestamp_utc, :naive_datetime
    field :subject_database, :string
    field :subject_id, Ecto.UUID
    field :subject_schema, :string
    field :subject_table, :string
    field :subject_uri, :string
    field :tenant_id, Ecto.UUID
    field :type_text, :string
    field :type_uri, :string
    field :updated_at_clock_count, :integer
    field :updated_at_timestamp_utc, :naive_datetime
    field :updated_by_text, :string
    field :weight, :decimal

    timestamps()
  end

  @doc false
  def changeset(edge, attrs) do
    edge
    |> cast(attrs, [:tenant_id, :type_uri, :type_text, :state_uri, :state_text, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_text, :subject_uri, :subject_database, :subject_schema, :subject_table, :subject_id, :predicate_uri, :predicate_database, :predicate_schema, :predicate_table, :predicate_id, :object_uri, :object_database, :object_schema, :object_table, :object_id, :start_at_timestamp_utc, :stop_at_timestamp_utc, :count, :weight, :unit_interval, :dual_interval])
    |> validate_required([:tenant_id, :type_uri, :type_text, :state_uri, :state_text, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_text, :subject_uri, :subject_database, :subject_schema, :subject_table, :subject_id, :predicate_uri, :predicate_database, :predicate_schema, :predicate_table, :predicate_id, :object_uri, :object_database, :object_schema, :object_table, :object_id, :start_at_timestamp_utc, :stop_at_timestamp_utc, :count, :weight, :unit_interval, :dual_interval])
  end
end
