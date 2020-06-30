defmodule ContactWeb.PhoneContactController do
  use ContactWeb, :controller

  alias Contact.Contactable
  alias Contact.Contactable.PhoneContact

  def index(conn, _params) do
    phone_contacts = Contactable.list_phone_contacts()
    render(conn, "index.html", phone_contacts: phone_contacts)
  end

  def new(conn, _params) do
    changeset = Contactable.change_phone_contact(%PhoneContact{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"phone_contact" => phone_contact_params}) do
    case Contactable.create_phone_contact(phone_contact_params) do
      {:ok, phone_contact} ->
        conn
        |> put_flash(:info, "Phone contact created successfully.")
        |> redirect(to: Routes.phone_contact_path(conn, :show, phone_contact))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    phone_contact = Contactable.get_phone_contact!(id)
    render(conn, "show.html", phone_contact: phone_contact)
  end

  def edit(conn, %{"id" => id}) do
    phone_contact = Contactable.get_phone_contact!(id)
    changeset = Contactable.change_phone_contact(phone_contact)
    render(conn, "edit.html", phone_contact: phone_contact, changeset: changeset)
  end

  def update(conn, %{"id" => id, "phone_contact" => phone_contact_params}) do
    phone_contact = Contactable.get_phone_contact!(id)

    case Contactable.update_phone_contact(phone_contact, phone_contact_params) do
      {:ok, phone_contact} ->
        conn
        |> put_flash(:info, "Phone contact updated successfully.")
        |> redirect(to: Routes.phone_contact_path(conn, :show, phone_contact))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", phone_contact: phone_contact, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    phone_contact = Contactable.get_phone_contact!(id)
    {:ok, _phone_contact} = Contactable.delete_phone_contact(phone_contact)

    conn
    |> put_flash(:info, "Phone contact deleted successfully.")
    |> redirect(to: Routes.phone_contact_path(conn, :index))
  end
end
