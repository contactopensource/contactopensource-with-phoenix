defmodule Contact.Repo.Migrations.CreatePersonNameKits do
  use Ecto.Migration

  def change do
    create table(:person_name_kits, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :created_at_timestamp_utc, :naive_datetime
      add :created_at_clock_count, :integer
      add :updated_at_timestamp_utc, :naive_datetime
      add :updated_at_clock_count, :integer
      add :updated_by_uri, :text
      add :tenant_uri, :text
      add :type_uri, :text
      add :state_uri, :text
      add :locale_id, :uuid
      add :given_name, :text
      add :given_name_phonetic, :text
      add :middle_name, :text
      add :middle_name_phonetic, :text
      add :family_name, :text
      add :family_name_phonetic, :text
      add :legal_name, :text
      add :legal_name_phonetic, :text
      add :prefix_name, :text
      add :prefix_name_phonetic, :text
      add :suffix_name, :text
      add :suffix_name_phonetic, :text
      add :salutation_name, :text
      add :salutation_name_phonetic, :text
      add :addressee_name, :text
      add :addressee_name_phonetic, :text
      add :nickname, :text
      add :nickname_phonetic, :text

      timestamps()
    end

  end
end
