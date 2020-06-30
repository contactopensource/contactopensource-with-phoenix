defmodule Contact.Repo.Migrations.CreatePostalContacts do
  use Ecto.Migration

  def change do
    create table(:postal_contacts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :created_at_timestamp_utc, :naive_datetime
      add :created_at_clock_count, :integer
      add :updated_at_timestamp_utc, :naive_datetime
      add :updated_at_clock_count, :integer
      add :updated_by_uri, :text
      add :tenant_uri, :text
      add :type_uri, :text
      add :state_uri, :text
      add :freeform, :text
      add :country_text, :text
      add :region_text, :text
      add :locality_text, :text
      add :neighborhood_text, :text
      add :postal_code_text, :text
      add :street_address_text, :text
      add :premise_address_text, :text
      add :global_location_number_text, :text

      timestamps()
    end

  end
end
