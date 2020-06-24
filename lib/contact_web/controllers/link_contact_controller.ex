defmodule ContactWeb.LinkContactController do
  use ContactWeb, :controller

  alias Contact.Contactable
  alias Contact.Contactable.LinkContact

  def index(conn, _params) do
    link_contacts = Contactable.list_link_contacts()
    render(conn, "index.html", link_contacts: link_contacts)
  end

  def new(conn, _params) do
    changeset = Contactable.change_link_contact(%LinkContact{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"link_contact" => link_contact_params}) do
    case Contactable.create_link_contact(link_contact_params) do
      {:ok, link_contact} ->
        conn
        |> put_flash(:info, "Link contact created successfully.")
        |> redirect(to: Routes.link_contact_path(conn, :show, link_contact))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    link_contact = Contactable.get_link_contact!(id)
    render(conn, "show.html", link_contact: link_contact)
  end

  def edit(conn, %{"id" => id}) do
    link_contact = Contactable.get_link_contact!(id)
    changeset = Contactable.change_link_contact(link_contact)
    render(conn, "edit.html", link_contact: link_contact, changeset: changeset)
  end

  def update(conn, %{"id" => id, "link_contact" => link_contact_params}) do
    link_contact = Contactable.get_link_contact!(id)

    case Contactable.update_link_contact(link_contact, link_contact_params) do
      {:ok, link_contact} ->
        conn
        |> put_flash(:info, "Link contact updated successfully.")
        |> redirect(to: Routes.link_contact_path(conn, :show, link_contact))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", link_contact: link_contact, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    link_contact = Contactable.get_link_contact!(id)
    {:ok, _link_contact} = Contactable.delete_link_contact(link_contact)

    conn
    |> put_flash(:info, "Link contact deleted successfully.")
    |> redirect(to: Routes.link_contact_path(conn, :index))
  end
end
