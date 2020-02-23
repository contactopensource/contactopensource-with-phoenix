defmodule Contact.Graph.Node do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "nodes" do
    field :json, :map
    field :number, :decimal
    field :state_text, :string
    field :state_uri, :string
    field :tenant_id, Ecto.UUID
    field :text, :string
    field :type_text, :string
    field :type_uri, :string
    field :updated_at_clock_count, :integer
    field :updated_at_timestamp_utc, :naive_datetime
    field :updated_by_text, :string
    field :xml, :string

    timestamps()
  end

  @doc false
  def changeset(node, attrs) do
    node
    |> cast(attrs, [:tenant_id, :type_uri, :type_text, :state_uri, :state_text, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_text, :text, :json, :xml, :number])
    |> validate_required([:tenant_id, :type_uri, :type_text, :state_uri, :state_text, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_text, :text, :json, :xml, :number])
  end
end
