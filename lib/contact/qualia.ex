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
end
