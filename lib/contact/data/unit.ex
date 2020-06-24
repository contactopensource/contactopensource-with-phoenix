defmodule Contact.Data.Unit do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "units" do
    field :name, :string
    field :state_text, :string
    field :state_uri, :string
    field :tenant_id, Ecto.UUID
    field :type_text, :string
    field :type_uri, :string
    field :updated_at_clock_count, :integer
    field :updated_at_timestamp_utc, :naive_datetime
    field :updated_by_text, :string

    timestamps()
  end

  @doc false
  def changeset(unit, attrs) do
    unit
    |> cast(attrs, [:tenant_id, :type_uri, :type_text, :state_uri, :state_text, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_text, :name])
    |> validate_required([:tenant_id, :type_uri, :type_text, :state_uri, :state_text, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_text, :name])
  end
end
