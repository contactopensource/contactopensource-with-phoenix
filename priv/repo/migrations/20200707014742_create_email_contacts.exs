defmodule Contact.Repo.Migrations.CreateEmailContacts do
  use Ecto.Migration

  def change do
    create table(:email_contacts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :created_at_timestamp_utc, :naive_datetime
      add :created_at_clock_count, :integer
      add :updated_at_timestamp_utc, :naive_datetime
      add :updated_at_clock_count, :integer
      add :updated_by_uri, :text
      add :tenant_uri, :text
      add :type_uri, :text
      add :state_uri, :text
      add :address, :text
      add :display_name, :text
      add :addr_spec, :text

      timestamps()
    end

  end
end
