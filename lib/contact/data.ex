defmodule Contact.Data do
  @moduledoc """
  The Data context.
  """

  import Ecto.Query, warn: false
  alias Contact.Repo

  alias Contact.Data.Locale

  @doc """
  Returns the list of locales.

  ## Examples

      iex> list_locales()
      [%Locale{}, ...]

  """
  def list_locales do
    Repo.all(Locale)
  end

  @doc """
  Gets a single locale.

  Raises `Ecto.NoResultsError` if the Locale does not exist.

  ## Examples

      iex> get_locale!(123)
      %Locale{}

      iex> get_locale!(456)
      ** (Ecto.NoResultsError)

  """
  def get_locale!(id), do: Repo.get!(Locale, id)

  @doc """
  Creates a locale.

  ## Examples

      iex> create_locale(%{field: value})
      {:ok, %Locale{}}

      iex> create_locale(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_locale(attrs \\ %{}) do
    %Locale{}
    |> Locale.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a locale.

  ## Examples

      iex> update_locale(locale, %{field: new_value})
      {:ok, %Locale{}}

      iex> update_locale(locale, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_locale(%Locale{} = locale, attrs) do
    locale
    |> Locale.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Locale.

  ## Examples

      iex> delete_locale(locale)
      {:ok, %Locale{}}

      iex> delete_locale(locale)
      {:error, %Ecto.Changeset{}}

  """
  def delete_locale(%Locale{} = locale) do
    Repo.delete(locale)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking locale changes.

  ## Examples

      iex> change_locale(locale)
      %Ecto.Changeset{source: %Locale{}}

  """
  def change_locale(%Locale{} = locale) do
    Locale.changeset(locale, %{})
  end
end
