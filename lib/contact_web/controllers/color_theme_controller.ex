defmodule ContactWeb.ColorThemeController do
  use ContactWeb, :controller

  alias Contact.Qualia
  alias Contact.Qualia.ColorTheme

  def index(conn, _params) do
    color_themes = Qualia.list_color_themes()
    render(conn, "index.html", color_themes: color_themes)
  end

  def new(conn, _params) do
    changeset = Qualia.change_color_theme(%ColorTheme{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"color_theme" => color_theme_params}) do
    case Qualia.create_color_theme(color_theme_params) do
      {:ok, color_theme} ->
        conn
        |> put_flash(:info, "Color theme created successfully.")
        |> redirect(to: Routes.color_theme_path(conn, :show, color_theme))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    color_theme = Qualia.get_color_theme!(id)
    render(conn, "show.html", color_theme: color_theme)
  end

  def edit(conn, %{"id" => id}) do
    color_theme = Qualia.get_color_theme!(id)
    changeset = Qualia.change_color_theme(color_theme)
    render(conn, "edit.html", color_theme: color_theme, changeset: changeset)
  end

  def update(conn, %{"id" => id, "color_theme" => color_theme_params}) do
    color_theme = Qualia.get_color_theme!(id)

    case Qualia.update_color_theme(color_theme, color_theme_params) do
      {:ok, color_theme} ->
        conn
        |> put_flash(:info, "Color theme updated successfully.")
        |> redirect(to: Routes.color_theme_path(conn, :show, color_theme))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", color_theme: color_theme, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    color_theme = Qualia.get_color_theme!(id)
    {:ok, _color_theme} = Qualia.delete_color_theme(color_theme)

    conn
    |> put_flash(:info, "Color theme deleted successfully.")
    |> redirect(to: Routes.color_theme_path(conn, :index))
  end
end
