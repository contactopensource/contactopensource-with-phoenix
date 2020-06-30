defmodule ContactWeb.GeoCenterController do
  use ContactWeb, :controller

  alias Contact.Geo
  alias Contact.Geo.GeoCenter

  def index(conn, _params) do
    geo_centers = Geo.list_geo_centers()
    render(conn, "index.html", geo_centers: geo_centers)
  end

  def new(conn, _params) do
    changeset = Geo.change_geo_center(%GeoCenter{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"geo_center" => geo_center_params}) do
    case Geo.create_geo_center(geo_center_params) do
      {:ok, geo_center} ->
        conn
        |> put_flash(:info, "Geo center created successfully.")
        |> redirect(to: Routes.geo_center_path(conn, :show, geo_center))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    geo_center = Geo.get_geo_center!(id)
    render(conn, "show.html", geo_center: geo_center)
  end

  def edit(conn, %{"id" => id}) do
    geo_center = Geo.get_geo_center!(id)
    changeset = Geo.change_geo_center(geo_center)
    render(conn, "edit.html", geo_center: geo_center, changeset: changeset)
  end

  def update(conn, %{"id" => id, "geo_center" => geo_center_params}) do
    geo_center = Geo.get_geo_center!(id)

    case Geo.update_geo_center(geo_center, geo_center_params) do
      {:ok, geo_center} ->
        conn
        |> put_flash(:info, "Geo center updated successfully.")
        |> redirect(to: Routes.geo_center_path(conn, :show, geo_center))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", geo_center: geo_center, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    geo_center = Geo.get_geo_center!(id)
    {:ok, _geo_center} = Geo.delete_geo_center(geo_center)

    conn
    |> put_flash(:info, "Geo center deleted successfully.")
    |> redirect(to: Routes.geo_center_path(conn, :index))
  end
end
