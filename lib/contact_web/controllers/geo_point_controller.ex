defmodule ContactWeb.GeoPointController do
  use ContactWeb, :controller

  alias Contact.Geo
  alias Contact.Geo.GeoPoint

  def index(conn, _params) do
    geo_points = Geo.list_geo_points()
    render(conn, "index.html", geo_points: geo_points)
  end

  def new(conn, _params) do
    changeset = Geo.change_geo_point(%GeoPoint{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"geo_point" => geo_point_params}) do
    case Geo.create_geo_point(geo_point_params) do
      {:ok, geo_point} ->
        conn
        |> put_flash(:info, "Geo point created successfully.")
        |> redirect(to: Routes.geo_point_path(conn, :show, geo_point))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    geo_point = Geo.get_geo_point!(id)
    render(conn, "show.html", geo_point: geo_point)
  end

  def edit(conn, %{"id" => id}) do
    geo_point = Geo.get_geo_point!(id)
    changeset = Geo.change_geo_point(geo_point)
    render(conn, "edit.html", geo_point: geo_point, changeset: changeset)
  end

  def update(conn, %{"id" => id, "geo_point" => geo_point_params}) do
    geo_point = Geo.get_geo_point!(id)

    case Geo.update_geo_point(geo_point, geo_point_params) do
      {:ok, geo_point} ->
        conn
        |> put_flash(:info, "Geo point updated successfully.")
        |> redirect(to: Routes.geo_point_path(conn, :show, geo_point))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", geo_point: geo_point, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    geo_point = Geo.get_geo_point!(id)
    {:ok, _geo_point} = Geo.delete_geo_point(geo_point)

    conn
    |> put_flash(:info, "Geo point deleted successfully.")
    |> redirect(to: Routes.geo_point_path(conn, :index))
  end
end
