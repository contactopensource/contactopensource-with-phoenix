defmodule ContactWeb.Api.UnitView do
  use ContactWeb, :view
  alias ContactWeb.Api.UnitView

  def render("index.json", %{units: units}) do
    %{data: render_many(units, UnitView, "unit.json")}
  end

  def render("show.json", %{unit: unit}) do
    %{data: render_one(unit, UnitView, "unit.json")}
  end

  def render("unit.json", %{unit: unit}) do
    %{id: unit.id,
      tenant_id: unit.tenant_id,
      type_uri: unit.type_uri,
      type_text: unit.type_text,
      state_uri: unit.state_uri,
      state_text: unit.state_text,
      updated_at_timestamp_utc: unit.updated_at_timestamp_utc,
      updated_at_clock_count: unit.updated_at_clock_count,
      updated_by_text: unit.updated_by_text,
      name: unit.name}
  end
end
