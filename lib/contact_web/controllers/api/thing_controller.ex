defmodule ContactWeb.Api.ThingController do
  use ContactWeb, :controller

  alias Contact.Concept
  alias Contact.Concept.Thing

  action_fallback ContactWeb.FallbackController

  def index(conn, _params) do
    things = Concept.list_things()
    render(conn, "index.json", things: things)
  end

  def create(conn, %{"thing" => thing_params}) do
    with {:ok, %Thing{} = thing} <- Concept.create_thing(thing_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_thing_path(conn, :show, thing))
      |> render("show.json", thing: thing)
    end
  end

  def show(conn, %{"id" => id}) do
    thing = Concept.get_thing!(id)
    render(conn, "show.json", thing: thing)
  end

  def update(conn, %{"id" => id, "thing" => thing_params}) do
    thing = Concept.get_thing!(id)

    with {:ok, %Thing{} = thing} <- Concept.update_thing(thing, thing_params) do
      render(conn, "show.json", thing: thing)
    end
  end

  def delete(conn, %{"id" => id}) do
    thing = Concept.get_thing!(id)

    with {:ok, %Thing{}} <- Concept.delete_thing(thing) do
      send_resp(conn, :no_content, "")
    end
  end
end
