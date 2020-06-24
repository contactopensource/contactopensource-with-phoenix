defmodule ContactWeb.Api.UnitController do
  use ContactWeb, :controller

  alias Contact.Data
  alias Contact.Data.Unit

  action_fallback ContactWeb.FallbackController

  def index(conn, _params) do
    units = Data.list_units()
    render(conn, "index.json", units: units)
  end

  def create(conn, %{"unit" => unit_params}) do
    with {:ok, %Unit{} = unit} <- Data.create_unit(unit_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_unit_path(conn, :show, unit))
      |> render("show.json", unit: unit)
    end
  end

  def show(conn, %{"id" => id}) do
    unit = Data.get_unit!(id)
    render(conn, "show.json", unit: unit)
  end

  def update(conn, %{"id" => id, "unit" => unit_params}) do
    unit = Data.get_unit!(id)

    with {:ok, %Unit{} = unit} <- Data.update_unit(unit, unit_params) do
      render(conn, "show.json", unit: unit)
    end
  end

  def delete(conn, %{"id" => id}) do
    unit = Data.get_unit!(id)

    with {:ok, %Unit{}} <- Data.delete_unit(unit) do
      send_resp(conn, :no_content, "")
    end
  end
end
