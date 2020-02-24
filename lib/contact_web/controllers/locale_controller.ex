defmodule ContactWeb.LocaleController do
  use ContactWeb, :controller

  alias Contact.Data
  alias Contact.Data.Locale

  def index(conn, _params) do
    locales = Data.list_locales()
    render(conn, "index.html", locales: locales)
  end

  def new(conn, _params) do
    changeset = Data.change_locale(%Locale{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"locale" => locale_params}) do
    case Data.create_locale(locale_params) do
      {:ok, locale} ->
        conn
        |> put_flash(:info, "Locale created successfully.")
        |> redirect(to: Routes.locale_path(conn, :show, locale))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    locale = Data.get_locale!(id)
    render(conn, "show.html", locale: locale)
  end

  def edit(conn, %{"id" => id}) do
    locale = Data.get_locale!(id)
    changeset = Data.change_locale(locale)
    render(conn, "edit.html", locale: locale, changeset: changeset)
  end

  def update(conn, %{"id" => id, "locale" => locale_params}) do
    locale = Data.get_locale!(id)

    case Data.update_locale(locale, locale_params) do
      {:ok, locale} ->
        conn
        |> put_flash(:info, "Locale updated successfully.")
        |> redirect(to: Routes.locale_path(conn, :show, locale))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", locale: locale, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    locale = Data.get_locale!(id)
    {:ok, _locale} = Data.delete_locale(locale)

    conn
    |> put_flash(:info, "Locale deleted successfully.")
    |> redirect(to: Routes.locale_path(conn, :index))
  end
end
