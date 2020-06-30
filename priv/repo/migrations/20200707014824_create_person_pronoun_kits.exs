defmodule Contact.Repo.Migrations.CreatePersonPronounKits do
  use Ecto.Migration

  def change do
    create table(:person_pronoun_kits, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :created_at_timestamp_utc, :naive_datetime
      add :created_at_clock_count, :integer
      add :updated_at_timestamp_utc, :naive_datetime
      add :updated_at_clock_count, :integer
      add :updated_by_uri, :text
      add :tenant_uri, :text
      add :type_uri, :text
      add :state_uri, :text
      add :subject_pronoun, :text
      add :object_pronoun, :text
      add :dependent_possessive_pronoun, :text
      add :independent_possessive_pronoun, :text
      add :reflexive_pronoun, :text
      add :intensive_pronoun, :text
      add :disjunctive_pronoun, :text

      timestamps()
    end

  end
end
