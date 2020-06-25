defmodule ContactWeb.ColorController do
  use ContactWeb, :controller

  alias Contact.Qualia
  alias Contact.Qualia.Color

  def index(conn, _params) do
    colors = Qualia.list_colors()
    render(conn, "index.html", colors: colors)
  end

  def new(conn, _params) do
    changeset = Qualia.change_color(%Color{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"color" => color_params}) do
    case Qualia.create_color(color_params) do
      {:ok, color} ->
        conn
        |> put_flash(:info, "Color created successfully.")
        |> redirect(to: Routes.color_path(conn, :show, color))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    color = Qualia.get_color!(id)
    render(conn, "show.html", color: color)
  end

  def edit(conn, %{"id" => id}) do
    color = Qualia.get_color!(id)
    changeset = Qualia.change_color(color)
    render(conn, "edit.html", color: color, changeset: changeset)
  end

  def update(conn, %{"id" => id, "color" => color_params}) do
    color = Qualia.get_color!(id)

    case Qualia.update_color(color, color_params) do
      {:ok, color} ->
        conn
        |> put_flash(:info, "Color updated successfully.")
        |> redirect(to: Routes.color_path(conn, :show, color))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", color: color, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    color = Qualia.get_color!(id)
    {:ok, _color} = Qualia.delete_color(color)

    conn
    |> put_flash(:info, "Color deleted successfully.")
    |> redirect(to: Routes.color_path(conn, :index))
  end
end
