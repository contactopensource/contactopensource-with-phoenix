defmodule Contact.Repo.Migrations.CreateLocales do
  use Ecto.Migration

  def change do
    create table(:locales, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :created_at_timestamp_utc, :naive_datetime
      add :created_at_clock_count, :integer
      add :updated_at_timestamp_utc, :naive_datetime
      add :updated_at_clock_count, :integer
      add :updated_by_uri, :text
      add :tenant_uri, :text
      add :type_uri, :text
      add :state_uri, :text
      add :text, :text
      add :language_code, :text
      add :country_code, :text
      add :script_code, :text
      add :region_code, :text
      add :variant_code, :text
      add :decimal_separator, :text
      add :grouping_separator, :text
      add :currency_code, :text
      add :currency_symbol, :text
      add :quotation_start_delimiter, :text
      add :quotation_stop_delimiter, :text

      timestamps()
    end

  end
end
