defmodule ContactWeb.UnitController do
  use ContactWeb, :controller

  alias Contact.Data
  alias Contact.Data.Unit

  def index(conn, _params) do
    units = Data.list_units()
    render(conn, "index.html", units: units)
  end

  def new(conn, _params) do
    changeset = Data.change_unit(%Unit{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"unit" => unit_params}) do
    case Data.create_unit(unit_params) do
      {:ok, unit} ->
        conn
        |> put_flash(:info, "Unit created successfully.")
        |> redirect(to: Routes.unit_path(conn, :show, unit))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    unit = Data.get_unit!(id)
    render(conn, "show.html", unit: unit)
  end

  def edit(conn, %{"id" => id}) do
    unit = Data.get_unit!(id)
    changeset = Data.change_unit(unit)
    render(conn, "edit.html", unit: unit, changeset: changeset)
  end

  def update(conn, %{"id" => id, "unit" => unit_params}) do
    unit = Data.get_unit!(id)

    case Data.update_unit(unit, unit_params) do
      {:ok, unit} ->
        conn
        |> put_flash(:info, "Unit updated successfully.")
        |> redirect(to: Routes.unit_path(conn, :show, unit))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", unit: unit, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    unit = Data.get_unit!(id)
    {:ok, _unit} = Data.delete_unit(unit)

    conn
    |> put_flash(:info, "Unit deleted successfully.")
    |> redirect(to: Routes.unit_path(conn, :index))
  end
end
