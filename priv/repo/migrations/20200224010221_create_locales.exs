defmodule Contact.Repo.Migrations.CreateLocales do
  use Ecto.Migration

  def change do
    create table(:locales) do
      add :tenant_id, :uuid
      add :type_uri, :text
      add :type_text, :text
      add :state_uri, :text
      add :state_text, :text
      add :updated_at_timestamp_utc, :naive_datetime
      add :updated_at_clock_count, :integer
      add :updated_by_text, :text
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
