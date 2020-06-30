defmodule ContactWeb.CodecController do
  use ContactWeb, :controller

  alias Contact.Data
  alias Contact.Data.Codec

  def index(conn, _params) do
    codecs = Data.list_codecs()
    render(conn, "index.html", codecs: codecs)
  end

  def new(conn, _params) do
    changeset = Data.change_codec(%Codec{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"codec" => codec_params}) do
    case Data.create_codec(codec_params) do
      {:ok, codec} ->
        conn
        |> put_flash(:info, "Codec created successfully.")
        |> redirect(to: Routes.codec_path(conn, :show, codec))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    codec = Data.get_codec!(id)
    render(conn, "show.html", codec: codec)
  end

  def edit(conn, %{"id" => id}) do
    codec = Data.get_codec!(id)
    changeset = Data.change_codec(codec)
    render(conn, "edit.html", codec: codec, changeset: changeset)
  end

  def update(conn, %{"id" => id, "codec" => codec_params}) do
    codec = Data.get_codec!(id)

    case Data.update_codec(codec, codec_params) do
      {:ok, codec} ->
        conn
        |> put_flash(:info, "Codec updated successfully.")
        |> redirect(to: Routes.codec_path(conn, :show, codec))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", codec: codec, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    codec = Data.get_codec!(id)
    {:ok, _codec} = Data.delete_codec(codec)

    conn
    |> put_flash(:info, "Codec deleted successfully.")
    |> redirect(to: Routes.codec_path(conn, :index))
  end
end
