defmodule Contact.Edge do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "edges" do
    field :count, :integer
    field :created_at_clock_count, :integer
    field :created_at_timestamp_utc, :naive_datetime
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
    field :probability, :decimal
    field :start_at_timestamp_utc, :naive_datetime
    field :state_uri, :string
    field :stop_at_timestamp_utc, :naive_datetime
    field :subject_database, :string
    field :subject_id, Ecto.UUID
    field :subject_schema, :string
    field :subject_table, :string
    field :subject_uri, :string
    field :tenant_uri, :string
    field :type_uri, :string
    field :updated_at_clock_count, :integer
    field :updated_at_timestamp_utc, :naive_datetime
    field :updated_by_uri, :string
    field :weight, :decimal

    timestamps()
  end

  @doc false
  def changeset(edge, attrs) do
    edge
    |> cast(attrs, [:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :subject_uri, :subject_database, :subject_schema, :subject_table, :subject_id, :predicate_uri, :predicate_database, :predicate_schema, :predicate_table, :predicate_id, :object_uri, :object_database, :object_schema, :object_table, :object_id, :start_at_timestamp_utc, :stop_at_timestamp_utc, :count, :weight, :probability])
    |> validate_required([:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :subject_uri, :subject_database, :subject_schema, :subject_table, :subject_id, :predicate_uri, :predicate_database, :predicate_schema, :predicate_table, :predicate_id, :object_uri, :object_database, :object_schema, :object_table, :object_id, :start_at_timestamp_utc, :stop_at_timestamp_utc, :count, :weight, :probability])
  end
end
