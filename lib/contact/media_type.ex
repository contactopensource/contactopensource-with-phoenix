defmodule Contact.MediaType do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "media_types" do
    field :created_at_clock_count, :integer
    field :created_at_timestamp_utc, :naive_datetime
    field :parameter_text, :string
    field :state_uri, :string
    field :subtype, :string
    field :suffix, :string
    field :supertype, :string
    field :tenant_uri, :string
    field :text, :string
    field :tree, :string
    field :type_uri, :string
    field :updated_at_clock_count, :integer
    field :updated_at_timestamp_utc, :naive_datetime
    field :updated_by_uri, :string

    timestamps()
  end

  @doc false
  def changeset(media_type, attrs) do
    media_type
    |> cast(attrs, [:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :text, :supertype, :subtype, :tree, :suffix, :parameter_text])
    |> validate_required([:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :text, :supertype, :subtype, :tree, :suffix, :parameter_text])
  end
end
