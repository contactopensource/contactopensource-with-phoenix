defmodule Contact.Repo.Migrations.CreatePassportContacts do
  use Ecto.Migration

  def change do
    create table(:passport_contacts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :created_at_timestamp_utc, :naive_datetime
      add :created_at_clock_count, :integer
      add :updated_at_timestamp_utc, :naive_datetime
      add :updated_at_clock_count, :integer
      add :updated_by_uri, :text
      add :tenant_uri, :text
      add :type_uri, :text
      add :state_uri, :text
      add :country_text, :text
      add :number_text, :text
      add :valid_start_date, :date
      add :valid_stop_date, :date

      timestamps()
    end

  end
end
