defmodule ContactWeb.ThingView do
  use ContactWeb, :view
  alias ContactWeb.ThingView

  def render("index.json", %{things: things}) do
    %{data: render_many(things, ThingView, "thing.json")}
  end

  def render("show.json", %{thing: thing}) do
    %{data: render_one(thing, ThingView, "thing.json")}
  end

  def render("thing.json", %{thing: thing}) do
    %{id: thing.id,
      tenant_id: thing.tenant_id,
      type_uri: thing.type_uri,
      type_text: thing.type_text,
      state_uri: thing.state_uri,
      state_text: thing.state_text,
      updated_at_timestamp_utc: thing.updated_at_timestamp_utc,
      updated_at_clock_count: thing.updated_at_clock_count,
      updated_by_text: thing.updated_by_text,
      name: thing.name}
  end
end
