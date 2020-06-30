defmodule ContactWeb.MediaTypeController do
  use ContactWeb, :controller

  alias Contact.Data
  alias Contact.Data.MediaType

  def index(conn, _params) do
    media_types = Data.list_media_types()
    render(conn, "index.html", media_types: media_types)
  end

  def new(conn, _params) do
    changeset = Data.change_media_type(%MediaType{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"media_type" => media_type_params}) do
    case Data.create_media_type(media_type_params) do
      {:ok, media_type} ->
        conn
        |> put_flash(:info, "Media type created successfully.")
        |> redirect(to: Routes.media_type_path(conn, :show, media_type))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    media_type = Data.get_media_type!(id)
    render(conn, "show.html", media_type: media_type)
  end

  def edit(conn, %{"id" => id}) do
    media_type = Data.get_media_type!(id)
    changeset = Data.change_media_type(media_type)
    render(conn, "edit.html", media_type: media_type, changeset: changeset)
  end

  def update(conn, %{"id" => id, "media_type" => media_type_params}) do
    media_type = Data.get_media_type!(id)

    case Data.update_media_type(media_type, media_type_params) do
      {:ok, media_type} ->
        conn
        |> put_flash(:info, "Media type updated successfully.")
        |> redirect(to: Routes.media_type_path(conn, :show, media_type))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", media_type: media_type, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    media_type = Data.get_media_type!(id)
    {:ok, _media_type} = Data.delete_media_type(media_type)

    conn
    |> put_flash(:info, "Media type deleted successfully.")
    |> redirect(to: Routes.media_type_path(conn, :index))
  end
end
