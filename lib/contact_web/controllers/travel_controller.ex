defmodule ContactWeb.TravelController do
  use ContactWeb, :controller

  alias Contact.Concept
  alias Contact.Concept.Travel

  def index(conn, _params) do
    travels = Concept.list_travels()
    render(conn, "index.html", travels: travels)
  end

  def new(conn, _params) do
    changeset = Concept.change_travel(%Travel{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"travel" => travel_params}) do
    case Concept.create_travel(travel_params) do
      {:ok, travel} ->
        conn
        |> put_flash(:info, "Travel created successfully.")
        |> redirect(to: Routes.travel_path(conn, :show, travel))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    travel = Concept.get_travel!(id)
    render(conn, "show.html", travel: travel)
  end

  def edit(conn, %{"id" => id}) do
    travel = Concept.get_travel!(id)
    changeset = Concept.change_travel(travel)
    render(conn, "edit.html", travel: travel, changeset: changeset)
  end

  def update(conn, %{"id" => id, "travel" => travel_params}) do
    travel = Concept.get_travel!(id)

    case Concept.update_travel(travel, travel_params) do
      {:ok, travel} ->
        conn
        |> put_flash(:info, "Travel updated successfully.")
        |> redirect(to: Routes.travel_path(conn, :show, travel))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", travel: travel, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    travel = Concept.get_travel!(id)
    {:ok, _travel} = Concept.delete_travel(travel)

    conn
    |> put_flash(:info, "Travel deleted successfully.")
    |> redirect(to: Routes.travel_path(conn, :index))
  end
end
