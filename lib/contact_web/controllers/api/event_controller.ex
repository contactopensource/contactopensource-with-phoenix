defmodule ContactWeb.Api.EventController do
  use ContactWeb, :controller

  alias Contact.Concept
  alias Contact.Concept.Event

  action_fallback ContactWeb.FallbackController

  def index(conn, _params) do
    events = Concept.list_events()
    render(conn, "index.json", events: events)
  end

  def create(conn, %{"event" => event_params}) do
    with {:ok, %Event{} = event} <- Concept.create_event(event_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_event_path(conn, :show, event))
      |> render("show.json", event: event)
    end
  end

  def show(conn, %{"id" => id}) do
    event = Concept.get_event!(id)
    render(conn, "show.json", event: event)
  end

  def update(conn, %{"id" => id, "event" => event_params}) do
    event = Concept.get_event!(id)

    with {:ok, %Event{} = event} <- Concept.update_event(event, event_params) do
      render(conn, "show.json", event: event)
    end
  end

  def delete(conn, %{"id" => id}) do
    event = Concept.get_event!(id)

    with {:ok, %Event{}} <- Concept.delete_event(event) do
      send_resp(conn, :no_content, "")
    end
  end
end
