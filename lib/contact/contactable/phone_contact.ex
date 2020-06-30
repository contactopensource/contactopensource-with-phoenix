defmodule Contact.Contactable.PhoneContact do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "phone_contacts" do
    field :created_at_clock_count, :integer
    field :created_at_timestamp_utc, :naive_datetime
    field :e164_country_code, :string
    field :e164_group_identification_code, :string
    field :e164_national_destination_code, :string
    field :e164_subscriber_number, :string
    field :e164_text, :string
    field :e164_trial_identification_code, :string
    field :label, :string
    field :number_text, :string
    field :state_uri, :string
    field :tenant_uri, :string
    field :type_uri, :string
    field :updated_at_clock_count, :integer
    field :updated_at_timestamp_utc, :naive_datetime
    field :updated_by_uri, :string

    timestamps()
  end

  @doc false
  def changeset(phone_contact, attrs) do
    phone_contact
    |> cast(attrs, [:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :label, :number_text, :e164_text, :e164_country_code, :e164_national_destination_code, :e164_group_identification_code, :e164_trial_identification_code, :e164_subscriber_number])
    |> validate_required([:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :label, :number_text, :e164_text, :e164_country_code, :e164_national_destination_code, :e164_group_identification_code, :e164_trial_identification_code, :e164_subscriber_number])
  end
end
