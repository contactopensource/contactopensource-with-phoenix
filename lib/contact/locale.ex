defmodule Contact.Locale do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "locales" do
    field :country_code, :string
    field :created_at_clock_count, :integer
    field :created_at_timestamp_utc, :naive_datetime
    field :currency_code, :string
    field :currency_symbol, :string
    field :decimal_separator, :string
    field :grouping_separator, :string
    field :language_code, :string
    field :quotation_start_delimiter, :string
    field :quotation_stop_delimiter, :string
    field :region_code, :string
    field :script_code, :string
    field :state_uri, :string
    field :tenant_uri, :string
    field :text, :string
    field :type_uri, :string
    field :updated_at_clock_count, :integer
    field :updated_at_timestamp_utc, :naive_datetime
    field :updated_by_uri, :string
    field :variant_code, :string

    timestamps()
  end

  @doc false
  def changeset(locale, attrs) do
    locale
    |> cast(attrs, [:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :text, :language_code, :country_code, :script_code, :region_code, :variant_code, :decimal_separator, :grouping_separator, :currency_code, :currency_symbol, :quotation_start_delimiter, :quotation_stop_delimiter])
    |> validate_required([:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :text, :language_code, :country_code, :script_code, :region_code, :variant_code, :decimal_separator, :grouping_separator, :currency_code, :currency_symbol, :quotation_start_delimiter, :quotation_stop_delimiter])
  end
end
