defmodule ContactWeb.Api.UriContactController do
  use ContactWeb, :controller

  alias Contact.Contactable
  alias Contact.Contactable.UriContact

  action_fallback ContactWeb.FallbackController

  def index(conn, _params) do
    uri_contacts = Contactable.list_uri_contacts()
    render(conn, "index.json", uri_contacts: uri_contacts)
  end

  def create(conn, %{"uri_contact" => uri_contact_params}) do
    with {:ok, %UriContact{} = uri_contact} <- Contactable.create_uri_contact(uri_contact_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_uri_contact_path(conn, :show, uri_contact))
      |> render("show.json", uri_contact: uri_contact)
    end
  end

  def show(conn, %{"id" => id}) do
    uri_contact = Contactable.get_uri_contact!(id)
    render(conn, "show.json", uri_contact: uri_contact)
  end

  def update(conn, %{"id" => id, "uri_contact" => uri_contact_params}) do
    uri_contact = Contactable.get_uri_contact!(id)

    with {:ok, %UriContact{} = uri_contact} <- Contactable.update_uri_contact(uri_contact, uri_contact_params) do
      render(conn, "show.json", uri_contact: uri_contact)
    end
  end

  def delete(conn, %{"id" => id}) do
    uri_contact = Contactable.get_uri_contact!(id)

    with {:ok, %UriContact{}} <- Contactable.delete_uri_contact(uri_contact) do
      send_resp(conn, :no_content, "")
    end
  end
end
