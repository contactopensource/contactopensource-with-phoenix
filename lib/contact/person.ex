defmodule Contact.Person do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "persons" do
    field :created_at_clock_count, :integer
    field :created_at_timestamp_utc, :naive_datetime
    field :saga, :string
    field :state_uri, :string
    field :subtitle, :string
    field :summary, :string
    field :tenant_uri, :string
    field :title, :string
    field :type_uri, :string
    field :updated_at_clock_count, :integer
    field :updated_at_timestamp_utc, :naive_datetime
    field :updated_by_uri, :string

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :title, :subtitle, :summary, :saga])
    |> validate_required([:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :title, :subtitle, :summary, :saga])
  end

  alias Contact.Person.PersonPronounKit

  @doc """
  Returns the list of person_pronoun_kits.

  ## Examples

      iex> list_person_pronoun_kits()
      [%PersonPronounKit{}, ...]

  """
  def list_person_pronoun_kits do
    Repo.all(PersonPronounKit)
  end

  @doc """
  Gets a single person_pronoun_kit.

  Raises `Ecto.NoResultsError` if the Person pronoun kit does not exist.

  ## Examples

      iex> get_person_pronoun_kit!(123)
      %PersonPronounKit{}

      iex> get_person_pronoun_kit!(456)
      ** (Ecto.NoResultsError)

  """
  def get_person_pronoun_kit!(id), do: Repo.get!(PersonPronounKit, id)

  @doc """
  Creates a person_pronoun_kit.

  ## Examples

      iex> create_person_pronoun_kit(%{field: value})
      {:ok, %PersonPronounKit{}}

      iex> create_person_pronoun_kit(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_person_pronoun_kit(attrs \\ %{}) do
    %PersonPronounKit{}
    |> PersonPronounKit.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a person_pronoun_kit.

  ## Examples

      iex> update_person_pronoun_kit(person_pronoun_kit, %{field: new_value})
      {:ok, %PersonPronounKit{}}

      iex> update_person_pronoun_kit(person_pronoun_kit, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_person_pronoun_kit(%PersonPronounKit{} = person_pronoun_kit, attrs) do
    person_pronoun_kit
    |> PersonPronounKit.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PersonPronounKit.

  ## Examples

      iex> delete_person_pronoun_kit(person_pronoun_kit)
      {:ok, %PersonPronounKit{}}

      iex> delete_person_pronoun_kit(person_pronoun_kit)
      {:error, %Ecto.Changeset{}}

  """
  def delete_person_pronoun_kit(%PersonPronounKit{} = person_pronoun_kit) do
    Repo.delete(person_pronoun_kit)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking person_pronoun_kit changes.

  ## Examples

      iex> change_person_pronoun_kit(person_pronoun_kit)
      %Ecto.Changeset{source: %PersonPronounKit{}}

  """
  def change_person_pronoun_kit(%PersonPronounKit{} = person_pronoun_kit) do
    PersonPronounKit.changeset(person_pronoun_kit, %{})
  end
end
