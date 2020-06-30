defmodule Contact.Repo.Migrations.CreatePhoneContacts do
  use Ecto.Migration

  def change do
    create table(:phone_contacts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :created_at_timestamp_utc, :naive_datetime
      add :created_at_clock_count, :integer
      add :updated_at_timestamp_utc, :naive_datetime
      add :updated_at_clock_count, :integer
      add :updated_by_uri, :text
      add :tenant_uri, :text
      add :type_uri, :text
      add :state_uri, :text
      add :label, :text
      add :number_text, :text
      add :e164_text, :text
      add :e164_country_code, :text
      add :e164_national_destination_code, :text
      add :e164_group_identification_code, :text
      add :e164_trial_identification_code, :text
      add :e164_subscriber_number, :text

      timestamps()
    end

  end
end
