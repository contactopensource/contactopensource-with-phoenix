defmodule Contact.Unit do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "units" do
    field :created_at_clock_count, :integer
    field :created_at_timestamp_utc, :naive_datetime
    field :name, :string
    field :state_uri, :string
    field :symbol, :string
    field :tenant_uri, :string
    field :type_uri, :string
    field :updated_at_clock_count, :integer
    field :updated_at_timestamp_utc, :naive_datetime
    field :updated_by_uri, :string

    timestamps()
  end

  @doc false
  def changeset(unit, attrs) do
    unit
    |> cast(attrs, [:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :name, :symbol])
    |> validate_required([:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :name, :symbol])
  end
end
