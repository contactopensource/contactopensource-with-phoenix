defmodule ContactWeb.PassportContactController do
  use ContactWeb, :controller

  alias Contact.Contactable
  alias Contact.Contactable.PassportContact

  def index(conn, _params) do
    passport_contacts = Contactable.list_passport_contacts()
    render(conn, "index.html", passport_contacts: passport_contacts)
  end

  def new(conn, _params) do
    changeset = Contactable.change_passport_contact(%PassportContact{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"passport_contact" => passport_contact_params}) do
    case Contactable.create_passport_contact(passport_contact_params) do
      {:ok, passport_contact} ->
        conn
        |> put_flash(:info, "Passport contact created successfully.")
        |> redirect(to: Routes.passport_contact_path(conn, :show, passport_contact))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    passport_contact = Contactable.get_passport_contact!(id)
    render(conn, "show.html", passport_contact: passport_contact)
  end

  def edit(conn, %{"id" => id}) do
    passport_contact = Contactable.get_passport_contact!(id)
    changeset = Contactable.change_passport_contact(passport_contact)
    render(conn, "edit.html", passport_contact: passport_contact, changeset: changeset)
  end

  def update(conn, %{"id" => id, "passport_contact" => passport_contact_params}) do
    passport_contact = Contactable.get_passport_contact!(id)

    case Contactable.update_passport_contact(passport_contact, passport_contact_params) do
      {:ok, passport_contact} ->
        conn
        |> put_flash(:info, "Passport contact updated successfully.")
        |> redirect(to: Routes.passport_contact_path(conn, :show, passport_contact))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", passport_contact: passport_contact, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    passport_contact = Contactable.get_passport_contact!(id)
    {:ok, _passport_contact} = Contactable.delete_passport_contact(passport_contact)

    conn
    |> put_flash(:info, "Passport contact deleted successfully.")
    |> redirect(to: Routes.passport_contact_path(conn, :index))
  end
end
