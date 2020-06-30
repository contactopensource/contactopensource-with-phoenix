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
    resources "/units", UnitController
    resources "/locales", LocaleController
    resources "/media_types", MediaTypeController
    resources "/currency_types", CurrencyTypeController
    resources "/codecs", CodecController
    resources "/colors", ColorController
    resources "/color_themes", ColorThemeController
    resources "/geo_points", GeoPointController
    resources "/geo_centers", GeoCenterController
    resources "/users", UserController
    resources "/groups", GroupController
    resources "/files", FileController
    resources "/folders", FolderController
    resources "/tags", TagController
    resources "/posts", PostController
    resources "/feeds", FeedController
    resources "/access_users", AccessUserController
    resources "/access_assignments", AccessAssignmentController
    resources "/access_attributes", AccessAttributeController
    resources "/access_permissions", AccessPermissionController
    resources "/access_operations", AccessOperationController
    resources "/uri_contacts", UriContactController
    resources "/email_contacts", EmailContactController
    resources "/phone_contacts", PhoneContactController
    resources "/postal_contacts", PostalContactController
    resources "/passport_contacts", PassportContactController
    resources "/persons", PersonController
    resources "/person_name_kits", PersonNameController
    resources "/person_pronoun_kits", PersonPronounController
    resources "/artists", ArtistController
    resources "/books", BookController
    resources "/things", ThingController
    resources "/events", EventController
    resources "/jobs", JobController
    resources "/movies", MovieController
    resources "/offers", OfferController
    resources "/organizations", OrganizationController
    resources "/places", PlaceController
    resources "/sports", SportController
    resources "/travels", TravelController
  end

  scope "/api", ContactWeb.Api, as: :api do
    pipe_through :api

    resources "/nodes", NodeController
    resources "/edges", EdgeController
    resources "/units", UnitController
    resources "/locales", LocaleController
    resources "/media_types", MediaTypeController
    resources "/currency_types", CurrencyTypeController
    resources "/codecs", CodecController
    resources "/colors", ColorController
    resources "/color_themes", ColorThemeController
    resources "/geo_points", GeoPointController
    resources "/geo_centers", GeoCenterController
    resources "/users", UserController
    resources "/groups", GroupController
    resources "/files", FileController
    resources "/folders", FolderController
    resources "/tags", TagController
    resources "/posts", PostController
    resources "/feeds", FeedController
    resources "/access_users", AccessUserController
    resources "/access_assignments", AccessAssignmentController
    resources "/access_attributes", AccessAttributeController
    resources "/access_permissions", AccessPermissionController
    resources "/access_operations", AccessOperationController
    resources "/uri_contacts", UriContactController
    resources "/email_contacts", EmailContactController
    resources "/phone_contacts", PhoneContactController
    resources "/postal_contacts", PostalContactController
    resources "/passport_contacts", PassportContactController
    resources "/persons", PersonController
    resources "/person_name_kits", PersonNameController
    resources "/person_pronoun_kits", PersonPronounController
    resources "/artists", ArtistController
    resources "/books", BookController
    resources "/things", ThingController
    resources "/events", EventController
    resources "/jobs", JobController
    resources "/movies", MovieController
    resources "/offers", OfferController
    resources "/organizations", OrganizationController
    resources "/places", PlaceController
    resources "/sports", SportController
    resources "/travels", TravelController
  end

end
