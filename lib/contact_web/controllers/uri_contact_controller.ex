defmodule ContactWeb.UriContactController do
  use ContactWeb, :controller

  alias Contact.Contactable
  alias Contact.Contactable.UriContact

  def index(conn, _params) do
    uri_contacts = Contactable.list_uri_contacts()
    render(conn, "index.html", uri_contacts: uri_contacts)
  end

  def new(conn, _params) do
    changeset = Contactable.change_uri_contact(%UriContact{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"uri_contact" => uri_contact_params}) do
    case Contactable.create_uri_contact(uri_contact_params) do
      {:ok, uri_contact} ->
        conn
        |> put_flash(:info, "Link contact created successfully.")
        |> redirect(to: Routes.uri_contact_path(conn, :show, uri_contact))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    uri_contact = Contactable.get_uri_contact!(id)
    render(conn, "show.html", uri_contact: uri_contact)
  end

  def edit(conn, %{"id" => id}) do
    uri_contact = Contactable.get_uri_contact!(id)
    changeset = Contactable.change_uri_contact(uri_contact)
    render(conn, "edit.html", uri_contact: uri_contact, changeset: changeset)
  end

  def update(conn, %{"id" => id, "uri_contact" => uri_contact_params}) do
    uri_contact = Contactable.get_uri_contact!(id)

    case Contactable.update_uri_contact(uri_contact, uri_contact_params) do
      {:ok, uri_contact} ->
        conn
        |> put_flash(:info, "Link contact updated successfully.")
        |> redirect(to: Routes.uri_contact_path(conn, :show, uri_contact))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", uri_contact: uri_contact, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    uri_contact = Contactable.get_uri_contact!(id)
    {:ok, _uri_contact} = Contactable.delete_uri_contact(uri_contact)

    conn
    |> put_flash(:info, "Link contact deleted successfully.")
    |> redirect(to: Routes.uri_contact_path(conn, :index))
  end
end
