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

  alias Contact.Data.Unit

  @doc """
  Returns the list of units.

  ## Examples

      iex> list_units()
      [%Unit{}, ...]

  """
  def list_units do
    Repo.all(Unit)
  end

  @doc """
  Gets a single unit.

  Raises `Ecto.NoResultsError` if the Unit does not exist.

  ## Examples

      iex> get_unit!(123)
      %Unit{}

      iex> get_unit!(456)
      ** (Ecto.NoResultsError)

  """
  def get_unit!(id), do: Repo.get!(Unit, id)

  @doc """
  Creates a unit.

  ## Examples

      iex> create_unit(%{field: value})
      {:ok, %Unit{}}

      iex> create_unit(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_unit(attrs \\ %{}) do
    %Unit{}
    |> Unit.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a unit.

  ## Examples

      iex> update_unit(unit, %{field: new_value})
      {:ok, %Unit{}}

      iex> update_unit(unit, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_unit(%Unit{} = unit, attrs) do
    unit
    |> Unit.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Unit.

  ## Examples

      iex> delete_unit(unit)
      {:ok, %Unit{}}

      iex> delete_unit(unit)
      {:error, %Ecto.Changeset{}}

  """
  def delete_unit(%Unit{} = unit) do
    Repo.delete(unit)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking unit changes.

  ## Examples

      iex> change_unit(unit)
      %Ecto.Changeset{source: %Unit{}}

  """
  def change_unit(%Unit{} = unit) do
    Unit.changeset(unit, %{})
  end

  alias Contact.Data.MediaType

  @doc """
  Returns the list of media_types.

  ## Examples

      iex> list_media_types()
      [%MediaType{}, ...]

  """
  def list_media_types do
    Repo.all(MediaType)
  end

  @doc """
  Gets a single media_type.

  Raises `Ecto.NoResultsError` if the Media type does not exist.

  ## Examples

      iex> get_media_type!(123)
      %MediaType{}

      iex> get_media_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_media_type!(id), do: Repo.get!(MediaType, id)

  @doc """
  Creates a media_type.

  ## Examples

      iex> create_media_type(%{field: value})
      {:ok, %MediaType{}}

      iex> create_media_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_media_type(attrs \\ %{}) do
    %MediaType{}
    |> MediaType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a media_type.

  ## Examples

      iex> update_media_type(media_type, %{field: new_value})
      {:ok, %MediaType{}}

      iex> update_media_type(media_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_media_type(%MediaType{} = media_type, attrs) do
    media_type
    |> MediaType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a MediaType.

  ## Examples

      iex> delete_media_type(media_type)
      {:ok, %MediaType{}}

      iex> delete_media_type(media_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_media_type(%MediaType{} = media_type) do
    Repo.delete(media_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking media_type changes.

  ## Examples

      iex> change_media_type(media_type)
      %Ecto.Changeset{source: %MediaType{}}

  """
  def change_media_type(%MediaType{} = media_type) do
    MediaType.changeset(media_type, %{})
  end

  alias Contact.Data.Codec

  @doc """
  Returns the list of codecs.

  ## Examples

      iex> list_codecs()
      [%Codec{}, ...]

  """
  def list_codecs do
    Repo.all(Codec)
  end

  @doc """
  Gets a single codec.

  Raises `Ecto.NoResultsError` if the Codec does not exist.

  ## Examples

      iex> get_codec!(123)
      %Codec{}

      iex> get_codec!(456)
      ** (Ecto.NoResultsError)

  """
  def get_codec!(id), do: Repo.get!(Codec, id)

  @doc """
  Creates a codec.

  ## Examples

      iex> create_codec(%{field: value})
      {:ok, %Codec{}}

      iex> create_codec(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_codec(attrs \\ %{}) do
    %Codec{}
    |> Codec.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a codec.

  ## Examples

      iex> update_codec(codec, %{field: new_value})
      {:ok, %Codec{}}

      iex> update_codec(codec, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_codec(%Codec{} = codec, attrs) do
    codec
    |> Codec.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Codec.

  ## Examples

      iex> delete_codec(codec)
      {:ok, %Codec{}}

      iex> delete_codec(codec)
      {:error, %Ecto.Changeset{}}

  """
  def delete_codec(%Codec{} = codec) do
    Repo.delete(codec)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking codec changes.

  ## Examples

      iex> change_codec(codec)
      %Ecto.Changeset{source: %Codec{}}

  """
  def change_codec(%Codec{} = codec) do
    Codec.changeset(codec, %{})
  end
end
