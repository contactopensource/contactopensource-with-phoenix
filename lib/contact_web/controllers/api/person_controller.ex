defmodule ContactWeb.Api.PersonController do
  use ContactWeb, :controller

  alias Contact.Concept
  alias Contact.Concept.Person

  action_fallback ContactWeb.FallbackController

  def index(conn, _params) do
    persons = Concept.list_persons()
    render(conn, "index.json", persons: persons)
  end

  def create(conn, %{"person" => person_params}) do
    with {:ok, %Person{} = person} <- Concept.create_person(person_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_person_path(conn, :show, person))
      |> render("show.json", person: person)
    end
  end

  def show(conn, %{"id" => id}) do
    person = Concept.get_person!(id)
    render(conn, "show.json", person: person)
  end

  def update(conn, %{"id" => id, "person" => person_params}) do
    person = Concept.get_person!(id)

    with {:ok, %Person{} = person} <- Concept.update_person(person, person_params) do
      render(conn, "show.json", person: person)
    end
  end

  def delete(conn, %{"id" => id}) do
    person = Concept.get_person!(id)

    with {:ok, %Person{}} <- Concept.delete_person(person) do
      send_resp(conn, :no_content, "")
    end
  end
end
