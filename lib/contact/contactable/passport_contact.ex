defmodule Contact.Contactable.PassportContact do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "passport_contacts" do
    field :country_text, :string
    field :created_at_clock_count, :integer
    field :created_at_timestamp_utc, :naive_datetime
    field :number_text, :string
    field :state_uri, :string
    field :tenant_uri, :string
    field :type_uri, :string
    field :updated_at_clock_count, :integer
    field :updated_at_timestamp_utc, :naive_datetime
    field :updated_by_uri, :string
    field :valid_start_date, :date
    field :valid_stop_date, :date

    timestamps()
  end

  @doc false
  def changeset(passport_contact, attrs) do
    passport_contact
    |> cast(attrs, [:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :country_text, :number_text, :valid_start_date, :valid_stop_date])
    |> validate_required([:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :country_text, :number_text, :valid_start_date, :valid_stop_date])
  end
end
