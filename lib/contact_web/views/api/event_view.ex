defmodule ContactWeb.Api.EventView do
  use ContactWeb, :view
  alias ContactWeb.Api.EventView

  def render("index.json", %{events: events}) do
    %{data: render_many(events, EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    %{data: render_one(event, EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    %{id: event.id,
      tenant_id: event.tenant_id,
      type_uri: event.type_uri,
      type_text: event.type_text,
      state_uri: event.state_uri,
      state_text: event.state_text,
      updated_at_timestamp_utc: event.updated_at_timestamp_utc,
      updated_at_clock_count: event.updated_at_clock_count,
      updated_by_text: event.updated_by_text,
      name: event.name}
  end
end
