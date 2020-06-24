defmodule Contact.Contactable do
  @moduledoc """
  The Contactable context.
  """

  import Ecto.Query, warn: false
  alias Contact.Repo

  alias Contact.Contactable.LinkContact

  @doc """
  Returns the list of link_contacts.

  ## Examples

      iex> list_link_contacts()
      [%LinkContact{}, ...]

  """
  def list_link_contacts do
    Repo.all(LinkContact)
  end

  @doc """
  Gets a single link_contact.

  Raises `Ecto.NoResultsError` if the Link contact does not exist.

  ## Examples

      iex> get_link_contact!(123)
      %LinkContact{}

      iex> get_link_contact!(456)
      ** (Ecto.NoResultsError)

  """
  def get_link_contact!(id), do: Repo.get!(LinkContact, id)

  @doc """
  Creates a link_contact.

  ## Examples

      iex> create_link_contact(%{field: value})
      {:ok, %LinkContact{}}

      iex> create_link_contact(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_link_contact(attrs \\ %{}) do
    %LinkContact{}
    |> LinkContact.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a link_contact.

  ## Examples

      iex> update_link_contact(link_contact, %{field: new_value})
      {:ok, %LinkContact{}}

      iex> update_link_contact(link_contact, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_link_contact(%LinkContact{} = link_contact, attrs) do
    link_contact
    |> LinkContact.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a LinkContact.

  ## Examples

      iex> delete_link_contact(link_contact)
      {:ok, %LinkContact{}}

      iex> delete_link_contact(link_contact)
      {:error, %Ecto.Changeset{}}

  """
  def delete_link_contact(%LinkContact{} = link_contact) do
    Repo.delete(link_contact)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking link_contact changes.

  ## Examples

      iex> change_link_contact(link_contact)
      %Ecto.Changeset{source: %LinkContact{}}

  """
  def change_link_contact(%LinkContact{} = link_contact) do
    LinkContact.changeset(link_contact, %{})
  end
end
