defmodule ContactWeb.PersonPronounKitController do
  use ContactWeb, :controller

  alias Contact.Person
  alias Contact.Person.PersonPronounKit

  def index(conn, _params) do
    person_pronoun_kits = Person.list_person_pronoun_kits()
    render(conn, "index.html", person_pronoun_kits: person_pronoun_kits)
  end

  def new(conn, _params) do
    changeset = Person.change_person_pronoun_kit(%PersonPronounKit{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"person_pronoun_kit" => person_pronoun_kit_params}) do
    case Person.create_person_pronoun_kit(person_pronoun_kit_params) do
      {:ok, person_pronoun_kit} ->
        conn
        |> put_flash(:info, "Person pronoun kit created successfully.")
        |> redirect(to: Routes.person_pronoun_kit_path(conn, :show, person_pronoun_kit))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    person_pronoun_kit = Person.get_person_pronoun_kit!(id)
    render(conn, "show.html", person_pronoun_kit: person_pronoun_kit)
  end

  def edit(conn, %{"id" => id}) do
    person_pronoun_kit = Person.get_person_pronoun_kit!(id)
    changeset = Person.change_person_pronoun_kit(person_pronoun_kit)
    render(conn, "edit.html", person_pronoun_kit: person_pronoun_kit, changeset: changeset)
  end

  def update(conn, %{"id" => id, "person_pronoun_kit" => person_pronoun_kit_params}) do
    person_pronoun_kit = Person.get_person_pronoun_kit!(id)

    case Person.update_person_pronoun_kit(person_pronoun_kit, person_pronoun_kit_params) do
      {:ok, person_pronoun_kit} ->
        conn
        |> put_flash(:info, "Person pronoun kit updated successfully.")
        |> redirect(to: Routes.person_pronoun_kit_path(conn, :show, person_pronoun_kit))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", person_pronoun_kit: person_pronoun_kit, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    person_pronoun_kit = Person.get_person_pronoun_kit!(id)
    {:ok, _person_pronoun_kit} = Person.delete_person_pronoun_kit(person_pronoun_kit)

    conn
    |> put_flash(:info, "Person pronoun kit deleted successfully.")
    |> redirect(to: Routes.person_pronoun_kit_path(conn, :index))
  end
end
