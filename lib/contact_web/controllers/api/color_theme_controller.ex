defmodule ContactWeb.Api.ColorThemeController do
  use ContactWeb, :controller

  alias Contact.Qualia
  alias Contact.Qualia.ColorTheme

  action_fallback ContactWeb.FallbackController

  def index(conn, _params) do
    color_themes = Qualia.list_color_themes()
    render(conn, "index.json", color_themes: color_themes)
  end

  def create(conn, %{"color_theme" => color_theme_params}) do
    with {:ok, %ColorTheme{} = color_theme} <- Qualia.create_color_theme(color_theme_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_color_theme_path(conn, :show, color_theme))
      |> render("show.json", color_theme: color_theme)
    end
  end

  def show(conn, %{"id" => id}) do
    color_theme = Qualia.get_color_theme!(id)
    render(conn, "show.json", color_theme: color_theme)
  end

  def update(conn, %{"id" => id, "color_theme" => color_theme_params}) do
    color_theme = Qualia.get_color_theme!(id)

    with {:ok, %ColorTheme{} = color_theme} <- Qualia.update_color_theme(color_theme, color_theme_params) do
      render(conn, "show.json", color_theme: color_theme)
    end
  end

  def delete(conn, %{"id" => id}) do
    color_theme = Qualia.get_color_theme!(id)

    with {:ok, %ColorTheme{}} <- Qualia.delete_color_theme(color_theme) do
      send_resp(conn, :no_content, "")
    end
  end
end
