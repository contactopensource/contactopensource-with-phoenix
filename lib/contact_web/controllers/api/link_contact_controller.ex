defmodule ContactWeb.Api.LinkContactController do
  use ContactWeb, :controller

  alias Contact.Contactable
  alias Contact.Contactable.LinkContact

  action_fallback ContactWeb.FallbackController

  def index(conn, _params) do
    link_contacts = Contactable.list_link_contacts()
    render(conn, "index.json", link_contacts: link_contacts)
  end

  def create(conn, %{"link_contact" => link_contact_params}) do
    with {:ok, %LinkContact{} = link_contact} <- Contactable.create_link_contact(link_contact_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_link_contact_path(conn, :show, link_contact))
      |> render("show.json", link_contact: link_contact)
    end
  end

  def show(conn, %{"id" => id}) do
    link_contact = Contactable.get_link_contact!(id)
    render(conn, "show.json", link_contact: link_contact)
  end

  def update(conn, %{"id" => id, "link_contact" => link_contact_params}) do
    link_contact = Contactable.get_link_contact!(id)

    with {:ok, %LinkContact{} = link_contact} <- Contactable.update_link_contact(link_contact, link_contact_params) do
      render(conn, "show.json", link_contact: link_contact)
    end
  end

  def delete(conn, %{"id" => id}) do
    link_contact = Contactable.get_link_contact!(id)

    with {:ok, %LinkContact{}} <- Contactable.delete_link_contact(link_contact) do
      send_resp(conn, :no_content, "")
    end
  end
end
