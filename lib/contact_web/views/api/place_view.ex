defmodule ContactWeb.Api.PlaceView do
  use ContactWeb, :view
  alias ContactWeb.Api.PlaceView

  def render("index.json", %{places: places}) do
    %{data: render_many(places, PlaceView, "place.json")}
  end

  def render("show.json", %{place: place}) do
    %{data: render_one(place, PlaceView, "place.json")}
  end

  def render("place.json", %{place: place}) do
    %{id: place.id,
      tenant_id: place.tenant_id,
      type_uri: place.type_uri,
      type_text: place.type_text,
      state_uri: place.state_uri,
      state_text: place.state_text,
      updated_at_timestamp_utc: place.updated_at_timestamp_utc,
      updated_at_clock_count: place.updated_at_clock_count,
      updated_by_text: place.updated_by_text,
      name: place.name}
  end
end
