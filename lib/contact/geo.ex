defmodule Contact.Geo do
  @moduledoc """
  The Geo context.
  """

  import Ecto.Query, warn: false
  alias Contact.Repo

  alias Contact.Geo.GeoPoint

  @doc """
  Returns the list of geo_points.

  ## Examples

      iex> list_geo_points()
      [%GeoPoint{}, ...]

  """
  def list_geo_points do
    Repo.all(GeoPoint)
  end

  @doc """
  Gets a single geo_point.

  Raises `Ecto.NoResultsError` if the Geo point does not exist.

  ## Examples

      iex> get_geo_point!(123)
      %GeoPoint{}

      iex> get_geo_point!(456)
      ** (Ecto.NoResultsError)

  """
  def get_geo_point!(id), do: Repo.get!(GeoPoint, id)

  @doc """
  Creates a geo_point.

  ## Examples

      iex> create_geo_point(%{field: value})
      {:ok, %GeoPoint{}}

      iex> create_geo_point(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_geo_point(attrs \\ %{}) do
    %GeoPoint{}
    |> GeoPoint.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a geo_point.

  ## Examples

      iex> update_geo_point(geo_point, %{field: new_value})
      {:ok, %GeoPoint{}}

      iex> update_geo_point(geo_point, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_geo_point(%GeoPoint{} = geo_point, attrs) do
    geo_point
    |> GeoPoint.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a GeoPoint.

  ## Examples

      iex> delete_geo_point(geo_point)
      {:ok, %GeoPoint{}}

      iex> delete_geo_point(geo_point)
      {:error, %Ecto.Changeset{}}

  """
  def delete_geo_point(%GeoPoint{} = geo_point) do
    Repo.delete(geo_point)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking geo_point changes.

  ## Examples

      iex> change_geo_point(geo_point)
      %Ecto.Changeset{source: %GeoPoint{}}

  """
  def change_geo_point(%GeoPoint{} = geo_point) do
    GeoPoint.changeset(geo_point, %{})
  end

  alias Contact.Geo.GeoCenter

  @doc """
  Returns the list of geo_centers.

  ## Examples

      iex> list_geo_centers()
      [%GeoCenter{}, ...]

  """
  def list_geo_centers do
    Repo.all(GeoCenter)
  end

  @doc """
  Gets a single geo_center.

  Raises `Ecto.NoResultsError` if the Geo center does not exist.

  ## Examples

      iex> get_geo_center!(123)
      %GeoCenter{}

      iex> get_geo_center!(456)
      ** (Ecto.NoResultsError)

  """
  def get_geo_center!(id), do: Repo.get!(GeoCenter, id)

  @doc """
  Creates a geo_center.

  ## Examples

      iex> create_geo_center(%{field: value})
      {:ok, %GeoCenter{}}

      iex> create_geo_center(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_geo_center(attrs \\ %{}) do
    %GeoCenter{}
    |> GeoCenter.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a geo_center.

  ## Examples

      iex> update_geo_center(geo_center, %{field: new_value})
      {:ok, %GeoCenter{}}

      iex> update_geo_center(geo_center, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_geo_center(%GeoCenter{} = geo_center, attrs) do
    geo_center
    |> GeoCenter.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a GeoCenter.

  ## Examples

      iex> delete_geo_center(geo_center)
      {:ok, %GeoCenter{}}

      iex> delete_geo_center(geo_center)
      {:error, %Ecto.Changeset{}}

  """
  def delete_geo_center(%GeoCenter{} = geo_center) do
    Repo.delete(geo_center)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking geo_center changes.

  ## Examples

      iex> change_geo_center(geo_center)
      %Ecto.Changeset{source: %GeoCenter{}}

  """
  def change_geo_center(%GeoCenter{} = geo_center) do
    GeoCenter.changeset(geo_center, %{})
  end
end
