defmodule ContactWeb.Api.PlaceController do
  use ContactWeb, :controller

  alias Contact.Concept
  alias Contact.Concept.Place

  action_fallback ContactWeb.FallbackController

  def index(conn, _params) do
    places = Concept.list_places()
    render(conn, "index.json", places: places)
  end

  def create(conn, %{"place" => place_params}) do
    with {:ok, %Place{} = place} <- Concept.create_place(place_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_place_path(conn, :show, place))
      |> render("show.json", place: place)
    end
  end

  def show(conn, %{"id" => id}) do
    place = Concept.get_place!(id)
    render(conn, "show.json", place: place)
  end

  def update(conn, %{"id" => id, "place" => place_params}) do
    place = Concept.get_place!(id)

    with {:ok, %Place{} = place} <- Concept.update_place(place, place_params) do
      render(conn, "show.json", place: place)
    end
  end

  def delete(conn, %{"id" => id}) do
    place = Concept.get_place!(id)

    with {:ok, %Place{}} <- Concept.delete_place(place) do
      send_resp(conn, :no_content, "")
    end
  end
end
