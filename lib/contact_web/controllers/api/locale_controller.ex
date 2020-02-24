defmodule ContactWeb.Api.LocaleController do
  use ContactWeb, :controller

  alias Contact.Data
  alias Contact.Data.Locale

  action_fallback ContactWeb.FallbackController

  def index(conn, _params) do
    locales = Data.list_locales()
    render(conn, "index.json", locales: locales)
  end

  def create(conn, %{"locale" => locale_params}) do
    with {:ok, %Locale{} = locale} <- Data.create_locale(locale_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.api_locale_path(conn, :show, locale))
      |> render("show.json", locale: locale)
    end
  end

  def show(conn, %{"id" => id}) do
    locale = Data.get_locale!(id)
    render(conn, "show.json", locale: locale)
  end

  def update(conn, %{"id" => id, "locale" => locale_params}) do
    locale = Data.get_locale!(id)

    with {:ok, %Locale{} = locale} <- Data.update_locale(locale, locale_params) do
      render(conn, "show.json", locale: locale)
    end
  end

  def delete(conn, %{"id" => id}) do
    locale = Data.get_locale!(id)

    with {:ok, %Locale{}} <- Data.delete_locale(locale) do
      send_resp(conn, :no_content, "")
    end
  end
end
