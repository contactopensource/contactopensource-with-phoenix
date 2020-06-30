defmodule Contact.PersonNameKit do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "person_name_kits" do
    field :addressee_name, :string
    field :addressee_name_phonetic, :string
    field :created_at_clock_count, :integer
    field :created_at_timestamp_utc, :naive_datetime
    field :family_name, :string
    field :family_name_phonetic, :string
    field :given_name, :string
    field :given_name_phonetic, :string
    field :legal_name, :string
    field :legal_name_phonetic, :string
    field :locale_id, Ecto.UUID
    field :middle_name, :string
    field :middle_name_phonetic, :string
    field :nickname, :string
    field :nickname_phonetic, :string
    field :prefix_name, :string
    field :prefix_name_phonetic, :string
    field :salutation_name, :string
    field :salutation_name_phonetic, :string
    field :state_uri, :string
    field :suffix_name, :string
    field :suffix_name_phonetic, :string
    field :tenant_uri, :string
    field :type_uri, :string
    field :updated_at_clock_count, :integer
    field :updated_at_timestamp_utc, :naive_datetime
    field :updated_by_uri, :string

    timestamps()
  end

  @doc false
  def changeset(person_name_kit, attrs) do
    person_name_kit
    |> cast(attrs, [:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :locale_id, :given_name, :given_name_phonetic, :middle_name, :middle_name_phonetic, :family_name, :family_name_phonetic, :legal_name, :legal_name_phonetic, :prefix_name, :prefix_name_phonetic, :suffix_name, :suffix_name_phonetic, :salutation_name, :salutation_name_phonetic, :addressee_name, :addressee_name_phonetic, :nickname, :nickname_phonetic])
    |> validate_required([:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :locale_id, :given_name, :given_name_phonetic, :middle_name, :middle_name_phonetic, :family_name, :family_name_phonetic, :legal_name, :legal_name_phonetic, :prefix_name, :prefix_name_phonetic, :suffix_name, :suffix_name_phonetic, :salutation_name, :salutation_name_phonetic, :addressee_name, :addressee_name_phonetic, :nickname, :nickname_phonetic])
  end
end
