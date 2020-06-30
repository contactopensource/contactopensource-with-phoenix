defmodule ContactWeb.EmailContactController do
  use ContactWeb, :controller

  alias Contact.Contactable
  alias Contact.Contactable.EmailContact

  def index(conn, _params) do
    email_contacts = Contactable.list_email_contacts()
    render(conn, "index.html", email_contacts: email_contacts)
  end

  def new(conn, _params) do
    changeset = Contactable.change_email_contact(%EmailContact{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"email_contact" => email_contact_params}) do
    case Contactable.create_email_contact(email_contact_params) do
      {:ok, email_contact} ->
        conn
        |> put_flash(:info, "Email contact created successfully.")
        |> redirect(to: Routes.email_contact_path(conn, :show, email_contact))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    email_contact = Contactable.get_email_contact!(id)
    render(conn, "show.html", email_contact: email_contact)
  end

  def edit(conn, %{"id" => id}) do
    email_contact = Contactable.get_email_contact!(id)
    changeset = Contactable.change_email_contact(email_contact)
    render(conn, "edit.html", email_contact: email_contact, changeset: changeset)
  end

  def update(conn, %{"id" => id, "email_contact" => email_contact_params}) do
    email_contact = Contactable.get_email_contact!(id)

    case Contactable.update_email_contact(email_contact, email_contact_params) do
      {:ok, email_contact} ->
        conn
        |> put_flash(:info, "Email contact updated successfully.")
        |> redirect(to: Routes.email_contact_path(conn, :show, email_contact))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", email_contact: email_contact, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    email_contact = Contactable.get_email_contact!(id)
    {:ok, _email_contact} = Contactable.delete_email_contact(email_contact)

    conn
    |> put_flash(:info, "Email contact deleted successfully.")
    |> redirect(to: Routes.email_contact_path(conn, :index))
  end
end
