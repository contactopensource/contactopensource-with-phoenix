defmodule ContactWeb.Api.ColorController do
  use ContactWeb, :controller

  alias Contact.Qualia
  alias Contact.Qualia.Color

  action_fallback ContactWeb.FallbackController

  def index(conn, _params) do
    colors = Qualia.list_colors()
    render(conn, "index.json", colors: colors)
  end

  def create(conn, %{"color" => color_params}) do
    with {:ok, %Color{} = color} <- Qualia.create_color(color_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_color_path(conn, :show, color))
      |> render("show.json", color: color)
    end
  end

  def show(conn, %{"id" => id}) do
    color = Qualia.get_color!(id)
    render(conn, "show.json", color: color)
  end

  def update(conn, %{"id" => id, "color" => color_params}) do
    color = Qualia.get_color!(id)

    with {:ok, %Color{} = color} <- Qualia.update_color(color, color_params) do
      render(conn, "show.json", color: color)
    end
  end

  def delete(conn, %{"id" => id}) do
    color = Qualia.get_color!(id)

    with {:ok, %Color{}} <- Qualia.delete_color(color) do
      send_resp(conn, :no_content, "")
    end
  end
end
