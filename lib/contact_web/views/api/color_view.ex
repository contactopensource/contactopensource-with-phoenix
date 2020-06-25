defmodule ContactWeb.Api.ColorView do
  use ContactWeb, :view
  alias ContactWeb.Api.ColorView

  def render("index.json", %{colors: colors}) do
    %{data: render_many(colors, ColorView, "color.json")}
  end

  def render("show.json", %{color: color}) do
    %{data: render_one(color, ColorView, "color.json")}
  end

  def render("color.json", %{color: color}) do
    %{id: color.id,
      updated_at_timestamp_utc: color.updated_at_timestamp_utc,
      updated_at_clock_count: color.updated_at_clock_count,
      updated_by_uri: color.updated_by_uri,
      tenant_uri: color.tenant_uri,
      type_uri: color.type_uri,
      state_uri: color.state_uri,
      rgb_unit_interval_r: color.rgb_unit_interval_r,
      rgb_unit_interval_g: color.rgb_unit_interval_g,
      rgb_unit_interval_b: color.rgb_unit_interval_b,
      cymk_unit_interval_c: color.cymk_unit_interval_c,
      cymk_unit_interval_y: color.cymk_unit_interval_y,
      cymk_unit_interval_m: color.cymk_unit_interval_m,
      cymk_unit_interval_k: color.cymk_unit_interval_k,
      hex: color.hex,
      html_color_name: color.html_color_name,
      x11_color_name: color.x11_color_name,
      color_naming_system_name: color.color_naming_system_name,
      pantone_matching_system_name: color.pantone_matching_system_name}
  end
end
