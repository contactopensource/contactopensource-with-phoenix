defmodule ContactWeb.Router do
  use ContactWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ContactWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/nodes", NodeController
    resources "/edges", EdgeController
    resources "/locales", LocaleController
    resources "/units", UnitController
    resources "/persons", PersonController
    resources "/places", PlaceController
    resources "/things", ThingController
    resources "/link_contacts", LinkContactController
  end

  scope "/api", ContactWeb.Api, as: :api do
    pipe_through :api

    resources "/nodes", NodeController
    resources "/edges", EdgeController
    resources "/locales", LocaleController
    resources "/units", UnitController
    resources "/persons", PersonController
    resources "/places", PlaceController
    resources "/things", ThingController
    resources "/link_contacts", LinkContactController
  end

end
