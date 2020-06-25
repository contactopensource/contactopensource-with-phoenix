defmodule Contact.Qualia do
  @moduledoc """
  The Qualia context.
  """

  import Ecto.Query, warn: false
  alias Contact.Repo

  alias Contact.Qualia.Color

  @doc """
  Returns the list of colors.

  ## Examples

      iex> list_colors()
      [%Color{}, ...]

  """
  def list_colors do
    Repo.all(Color)
  end

  @doc """
  Gets a single color.

  Raises `Ecto.NoResultsError` if the Color does not exist.

  ## Examples

      iex> get_color!(123)
      %Color{}

      iex> get_color!(456)
      ** (Ecto.NoResultsError)

  """
  def get_color!(id), do: Repo.get!(Color, id)

  @doc """
  Creates a color.

  ## Examples

      iex> create_color(%{field: value})
      {:ok, %Color{}}

      iex> create_color(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_color(attrs \\ %{}) do
    %Color{}
    |> Color.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a color.

  ## Examples

      iex> update_color(color, %{field: new_value})
      {:ok, %Color{}}

      iex> update_color(color, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_color(%Color{} = color, attrs) do
    color
    |> Color.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Color.

  ## Examples

      iex> delete_color(color)
      {:ok, %Color{}}

      iex> delete_color(color)
      {:error, %Ecto.Changeset{}}

  """
  def delete_color(%Color{} = color) do
    Repo.delete(color)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking color changes.

  ## Examples

      iex> change_color(color)
      %Ecto.Changeset{source: %Color{}}

  """
  def change_color(%Color{} = color) do
    Color.changeset(color, %{})
  end

  alias Contact.Qualia.ColorTheme

  @doc """
  Returns the list of color_themes.

  ## Examples

      iex> list_color_themes()
      [%ColorTheme{}, ...]

  """
  def list_color_themes do
    Repo.all(ColorTheme)
  end

  @doc """
  Gets a single color_theme.

  Raises `Ecto.NoResultsError` if the Color theme does not exist.

  ## Examples

      iex> get_color_theme!(123)
      %ColorTheme{}

      iex> get_color_theme!(456)
      ** (Ecto.NoResultsError)

  """
  def get_color_theme!(id), do: Repo.get!(ColorTheme, id)

  @doc """
  Creates a color_theme.

  ## Examples

      iex> create_color_theme(%{field: value})
      {:ok, %ColorTheme{}}

      iex> create_color_theme(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_color_theme(attrs \\ %{}) do
    %ColorTheme{}
    |> ColorTheme.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a color_theme.

  ## Examples

      iex> update_color_theme(color_theme, %{field: new_value})
      {:ok, %ColorTheme{}}

      iex> update_color_theme(color_theme, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_color_theme(%ColorTheme{} = color_theme, attrs) do
    color_theme
    |> ColorTheme.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ColorTheme.

  ## Examples

      iex> delete_color_theme(color_theme)
      {:ok, %ColorTheme{}}

      iex> delete_color_theme(color_theme)
      {:error, %Ecto.Changeset{}}

  """
  def delete_color_theme(%ColorTheme{} = color_theme) do
    Repo.delete(color_theme)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking color_theme changes.

  ## Examples

      iex> change_color_theme(color_theme)
      %Ecto.Changeset{source: %ColorTheme{}}

  """
  def change_color_theme(%ColorTheme{} = color_theme) do
    ColorTheme.changeset(color_theme, %{})
  end
end
