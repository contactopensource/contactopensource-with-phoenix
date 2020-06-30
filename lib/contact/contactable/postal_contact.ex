defmodule Contact.Contactable.PostalContact do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "postal_contacts" do
    field :country_text, :string
    field :created_at_clock_count, :integer
    field :created_at_timestamp_utc, :naive_datetime
    field :freeform, :string
    field :global_location_number_text, :string
    field :locality_text, :string
    field :neighborhood_text, :string
    field :postal_code_text, :string
    field :premise_address_text, :string
    field :region_text, :string
    field :state_uri, :string
    field :street_address_text, :string
    field :tenant_uri, :string
    field :type_uri, :string
    field :updated_at_clock_count, :integer
    field :updated_at_timestamp_utc, :naive_datetime
    field :updated_by_uri, :string

    timestamps()
  end

  @doc false
  def changeset(postal_contact, attrs) do
    postal_contact
    |> cast(attrs, [:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :freeform, :country_text, :region_text, :locality_text, :neighborhood_text, :postal_code_text, :street_address_text, :premise_address_text, :global_location_number_text])
    |> validate_required([:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :freeform, :country_text, :region_text, :locality_text, :neighborhood_text, :postal_code_text, :street_address_text, :premise_address_text, :global_location_number_text])
  end
end
