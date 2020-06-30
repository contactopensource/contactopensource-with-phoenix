defmodule ContactWeb.FolderController do
  use ContactWeb, :controller

  alias Contact.Content
  alias Contact.Content.Folder

  def index(conn, _params) do
    folders = Content.list_folders()
    render(conn, "index.html", folders: folders)
  end

  def new(conn, _params) do
    changeset = Content.change_folder(%Folder{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"folder" => folder_params}) do
    case Content.create_folder(folder_params) do
      {:ok, folder} ->
        conn
        |> put_flash(:info, "Folder created successfully.")
        |> redirect(to: Routes.folder_path(conn, :show, folder))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    folder = Content.get_folder!(id)
    render(conn, "show.html", folder: folder)
  end

  def edit(conn, %{"id" => id}) do
    folder = Content.get_folder!(id)
    changeset = Content.change_folder(folder)
    render(conn, "edit.html", folder: folder, changeset: changeset)
  end

  def update(conn, %{"id" => id, "folder" => folder_params}) do
    folder = Content.get_folder!(id)

    case Content.update_folder(folder, folder_params) do
      {:ok, folder} ->
        conn
        |> put_flash(:info, "Folder updated successfully.")
        |> redirect(to: Routes.folder_path(conn, :show, folder))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", folder: folder, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    folder = Content.get_folder!(id)
    {:ok, _folder} = Content.delete_folder(folder)

    conn
    |> put_flash(:info, "Folder deleted successfully.")
    |> redirect(to: Routes.folder_path(conn, :index))
  end
end
