defmodule Contact.Contactable do
  @moduledoc """
  The Contactable context.
  """

  import Ecto.Query, warn: false
  alias Contact.Repo

  alias Contact.Contactable.UriContact

  @doc """
  Returns the list of uri_contacts.

  ## Examples

      iex> list_uri_contacts()
      [%UriContact{}, ...]

  """
  def list_uri_contacts do
    Repo.all(UriContact)
  end

  @doc """
  Gets a single uri_contact.

  Raises `Ecto.NoResultsError` if the Link contact does not exist.

  ## Examples

      iex> get_uri_contact!(123)
      %UriContact{}

      iex> get_uri_contact!(456)
      ** (Ecto.NoResultsError)

  """
  def get_uri_contact!(id), do: Repo.get!(UriContact, id)

  @doc """
  Creates a uri_contact.

  ## Examples

      iex> create_uri_contact(%{field: value})
      {:ok, %UriContact{}}

      iex> create_uri_contact(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_uri_contact(attrs \\ %{}) do
    %UriContact{}
    |> UriContact.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a uri_contact.

  ## Examples

      iex> update_uri_contact(uri_contact, %{field: new_value})
      {:ok, %UriContact{}}

      iex> update_uri_contact(uri_contact, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_uri_contact(%UriContact{} = uri_contact, attrs) do
    uri_contact
    |> UriContact.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a UriContact.

  ## Examples

      iex> delete_uri_contact(uri_contact)
      {:ok, %UriContact{}}

      iex> delete_uri_contact(uri_contact)
      {:error, %Ecto.Changeset{}}

  """
  def delete_uri_contact(%UriContact{} = uri_contact) do
    Repo.delete(uri_contact)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking uri_contact changes.

  ## Examples

      iex> change_uri_contact(uri_contact)
      %Ecto.Changeset{source: %UriContact{}}

  """
  def change_uri_contact(%UriContact{} = uri_contact) do
    UriContact.changeset(uri_contact, %{})
  end

  alias Contact.Contactable.EmailContact

  @doc """
  Returns the list of email_contacts.

  ## Examples

      iex> list_email_contacts()
      [%EmailContact{}, ...]

  """
  def list_email_contacts do
    Repo.all(EmailContact)
  end

  @doc """
  Gets a single email_contact.

  Raises `Ecto.NoResultsError` if the Email contact does not exist.

  ## Examples

      iex> get_email_contact!(123)
      %EmailContact{}

      iex> get_email_contact!(456)
      ** (Ecto.NoResultsError)

  """
  def get_email_contact!(id), do: Repo.get!(EmailContact, id)

  @doc """
  Creates a email_contact.

  ## Examples

      iex> create_email_contact(%{field: value})
      {:ok, %EmailContact{}}

      iex> create_email_contact(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_email_contact(attrs \\ %{}) do
    %EmailContact{}
    |> EmailContact.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a email_contact.

  ## Examples

      iex> update_email_contact(email_contact, %{field: new_value})
      {:ok, %EmailContact{}}

      iex> update_email_contact(email_contact, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_email_contact(%EmailContact{} = email_contact, attrs) do
    email_contact
    |> EmailContact.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a EmailContact.

  ## Examples

      iex> delete_email_contact(email_contact)
      {:ok, %EmailContact{}}

      iex> delete_email_contact(email_contact)
      {:error, %Ecto.Changeset{}}

  """
  def delete_email_contact(%EmailContact{} = email_contact) do
    Repo.delete(email_contact)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking email_contact changes.

  ## Examples

      iex> change_email_contact(email_contact)
      %Ecto.Changeset{source: %EmailContact{}}

  """
  def change_email_contact(%EmailContact{} = email_contact) do
    EmailContact.changeset(email_contact, %{})
  end

  alias Contact.Contactable.PhoneContact

  @doc """
  Returns the list of phone_contacts.

  ## Examples

      iex> list_phone_contacts()
      [%PhoneContact{}, ...]

  """
  def list_phone_contacts do
    Repo.all(PhoneContact)
  end

  @doc """
  Gets a single phone_contact.

  Raises `Ecto.NoResultsError` if the Phone contact does not exist.

  ## Examples

      iex> get_phone_contact!(123)
      %PhoneContact{}

      iex> get_phone_contact!(456)
      ** (Ecto.NoResultsError)

  """
  def get_phone_contact!(id), do: Repo.get!(PhoneContact, id)

  @doc """
  Creates a phone_contact.

  ## Examples

      iex> create_phone_contact(%{field: value})
      {:ok, %PhoneContact{}}

      iex> create_phone_contact(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_phone_contact(attrs \\ %{}) do
    %PhoneContact{}
    |> PhoneContact.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a phone_contact.

  ## Examples

      iex> update_phone_contact(phone_contact, %{field: new_value})
      {:ok, %PhoneContact{}}

      iex> update_phone_contact(phone_contact, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_phone_contact(%PhoneContact{} = phone_contact, attrs) do
    phone_contact
    |> PhoneContact.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PhoneContact.

  ## Examples

      iex> delete_phone_contact(phone_contact)
      {:ok, %PhoneContact{}}

      iex> delete_phone_contact(phone_contact)
      {:error, %Ecto.Changeset{}}

  """
  def delete_phone_contact(%PhoneContact{} = phone_contact) do
    Repo.delete(phone_contact)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking phone_contact changes.

  ## Examples

      iex> change_phone_contact(phone_contact)
      %Ecto.Changeset{source: %PhoneContact{}}

  """
  def change_phone_contact(%PhoneContact{} = phone_contact) do
    PhoneContact.changeset(phone_contact, %{})
  end

  alias Contact.Contactable.PostalContact

  @doc """
  Returns the list of postal_contacts.

  ## Examples

      iex> list_postal_contacts()
      [%PostalContact{}, ...]

  """
  def list_postal_contacts do
    Repo.all(PostalContact)
  end

  @doc """
  Gets a single postal_contact.

  Raises `Ecto.NoResultsError` if the Postal contact does not exist.

  ## Examples

      iex> get_postal_contact!(123)
      %PostalContact{}

      iex> get_postal_contact!(456)
      ** (Ecto.NoResultsError)

  """
  def get_postal_contact!(id), do: Repo.get!(PostalContact, id)

  @doc """
  Creates a postal_contact.

  ## Examples

      iex> create_postal_contact(%{field: value})
      {:ok, %PostalContact{}}

      iex> create_postal_contact(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_postal_contact(attrs \\ %{}) do
    %PostalContact{}
    |> PostalContact.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a postal_contact.

  ## Examples

      iex> update_postal_contact(postal_contact, %{field: new_value})
      {:ok, %PostalContact{}}

      iex> update_postal_contact(postal_contact, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_postal_contact(%PostalContact{} = postal_contact, attrs) do
    postal_contact
    |> PostalContact.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PostalContact.

  ## Examples

      iex> delete_postal_contact(postal_contact)
      {:ok, %PostalContact{}}

      iex> delete_postal_contact(postal_contact)
      {:error, %Ecto.Changeset{}}

  """
  def delete_postal_contact(%PostalContact{} = postal_contact) do
    Repo.delete(postal_contact)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking postal_contact changes.

  ## Examples

      iex> change_postal_contact(postal_contact)
      %Ecto.Changeset{source: %PostalContact{}}

  """
  def change_postal_contact(%PostalContact{} = postal_contact) do
    PostalContact.changeset(postal_contact, %{})
  end

  alias Contact.Contactable.PassportContact

  @doc """
  Returns the list of passport_contacts.

  ## Examples

      iex> list_passport_contacts()
      [%PassportContact{}, ...]

  """
  def list_passport_contacts do
    Repo.all(PassportContact)
  end

  @doc """
  Gets a single passport_contact.

  Raises `Ecto.NoResultsError` if the Passport contact does not exist.

  ## Examples

      iex> get_passport_contact!(123)
      %PassportContact{}

      iex> get_passport_contact!(456)
      ** (Ecto.NoResultsError)

  """
  def get_passport_contact!(id), do: Repo.get!(PassportContact, id)

  @doc """
  Creates a passport_contact.

  ## Examples

      iex> create_passport_contact(%{field: value})
      {:ok, %PassportContact{}}

      iex> create_passport_contact(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_passport_contact(attrs \\ %{}) do
    %PassportContact{}
    |> PassportContact.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a passport_contact.

  ## Examples

      iex> update_passport_contact(passport_contact, %{field: new_value})
      {:ok, %PassportContact{}}

      iex> update_passport_contact(passport_contact, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_passport_contact(%PassportContact{} = passport_contact, attrs) do
    passport_contact
    |> PassportContact.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PassportContact.

  ## Examples

      iex> delete_passport_contact(passport_contact)
      {:ok, %PassportContact{}}

      iex> delete_passport_contact(passport_contact)
      {:error, %Ecto.Changeset{}}

  """
  def delete_passport_contact(%PassportContact{} = passport_contact) do
    Repo.delete(passport_contact)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking passport_contact changes.

  ## Examples

      iex> change_passport_contact(passport_contact)
      %Ecto.Changeset{source: %PassportContact{}}

  """
  def change_passport_contact(%PassportContact{} = passport_contact) do
    PassportContact.changeset(passport_contact, %{})
  end
end
