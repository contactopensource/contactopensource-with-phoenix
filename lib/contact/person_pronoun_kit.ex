defmodule Contact.PersonPronounKit do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "person_pronoun_kits" do
    field :created_at_clock_count, :integer
    field :created_at_timestamp_utc, :naive_datetime
    field :dependent_possessive_pronoun, :string
    field :disjunctive_pronoun, :string
    field :independent_possessive_pronoun, :string
    field :intensive_pronoun, :string
    field :object_pronoun, :string
    field :reflexive_pronoun, :string
    field :state_uri, :string
    field :subject_pronoun, :string
    field :tenant_uri, :string
    field :type_uri, :string
    field :updated_at_clock_count, :integer
    field :updated_at_timestamp_utc, :naive_datetime
    field :updated_by_uri, :string

    timestamps()
  end

  @doc false
  def changeset(person_pronoun_kit, attrs) do
    person_pronoun_kit
    |> cast(attrs, [:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :subject_pronoun, :object_pronoun, :dependent_possessive_pronoun, :independent_possessive_pronoun, :reflexive_pronoun, :intensive_pronoun, :disjunctive_pronoun])
    |> validate_required([:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :subject_pronoun, :object_pronoun, :dependent_possessive_pronoun, :independent_possessive_pronoun, :reflexive_pronoun, :intensive_pronoun, :disjunctive_pronoun])
  end
end
