defmodule ContactWeb.PostalContactController do
  use ContactWeb, :controller

  alias Contact.Contactable
  alias Contact.Contactable.PostalContact

  def index(conn, _params) do
    postal_contacts = Contactable.list_postal_contacts()
    render(conn, "index.html", postal_contacts: postal_contacts)
  end

  def new(conn, _params) do
    changeset = Contactable.change_postal_contact(%PostalContact{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"postal_contact" => postal_contact_params}) do
    case Contactable.create_postal_contact(postal_contact_params) do
      {:ok, postal_contact} ->
        conn
        |> put_flash(:info, "Postal contact created successfully.")
        |> redirect(to: Routes.postal_contact_path(conn, :show, postal_contact))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    postal_contact = Contactable.get_postal_contact!(id)
    render(conn, "show.html", postal_contact: postal_contact)
  end

  def edit(conn, %{"id" => id}) do
    postal_contact = Contactable.get_postal_contact!(id)
    changeset = Contactable.change_postal_contact(postal_contact)
    render(conn, "edit.html", postal_contact: postal_contact, changeset: changeset)
  end

  def update(conn, %{"id" => id, "postal_contact" => postal_contact_params}) do
    postal_contact = Contactable.get_postal_contact!(id)

    case Contactable.update_postal_contact(postal_contact, postal_contact_params) do
      {:ok, postal_contact} ->
        conn
        |> put_flash(:info, "Postal contact updated successfully.")
        |> redirect(to: Routes.postal_contact_path(conn, :show, postal_contact))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", postal_contact: postal_contact, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    postal_contact = Contactable.get_postal_contact!(id)
    {:ok, _postal_contact} = Contactable.delete_postal_contact(postal_contact)

    conn
    |> put_flash(:info, "Postal contact deleted successfully.")
    |> redirect(to: Routes.postal_contact_path(conn, :index))
  end
end
