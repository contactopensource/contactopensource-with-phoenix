defmodule ContactWeb.PersonNameKitController do
  use ContactWeb, :controller

  alias Contact.Concept
  alias Contact.Concept.PersonNameKit

  def index(conn, _params) do
    person_name_kits = Concept.list_person_name_kits()
    render(conn, "index.html", person_name_kits: person_name_kits)
  end

  def new(conn, _params) do
    changeset = Concept.change_person_name_kit(%PersonNameKit{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"person_name_kit" => person_name_kit_params}) do
    case Concept.create_person_name_kit(person_name_kit_params) do
      {:ok, person_name_kit} ->
        conn
        |> put_flash(:info, "Person name kit created successfully.")
        |> redirect(to: Routes.person_name_kit_path(conn, :show, person_name_kit))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    person_name_kit = Concept.get_person_name_kit!(id)
    render(conn, "show.html", person_name_kit: person_name_kit)
  end

  def edit(conn, %{"id" => id}) do
    person_name_kit = Concept.get_person_name_kit!(id)
    changeset = Concept.change_person_name_kit(person_name_kit)
    render(conn, "edit.html", person_name_kit: person_name_kit, changeset: changeset)
  end

  def update(conn, %{"id" => id, "person_name_kit" => person_name_kit_params}) do
    person_name_kit = Concept.get_person_name_kit!(id)

    case Concept.update_person_name_kit(person_name_kit, person_name_kit_params) do
      {:ok, person_name_kit} ->
        conn
        |> put_flash(:info, "Person name kit updated successfully.")
        |> redirect(to: Routes.person_name_kit_path(conn, :show, person_name_kit))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", person_name_kit: person_name_kit, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    person_name_kit = Concept.get_person_name_kit!(id)
    {:ok, _person_name_kit} = Concept.delete_person_name_kit(person_name_kit)

    conn
    |> put_flash(:info, "Person name kit deleted successfully.")
    |> redirect(to: Routes.person_name_kit_path(conn, :index))
  end
end
