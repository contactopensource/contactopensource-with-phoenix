defmodule ContactWeb.Api.ColorThemeView do
  use ContactWeb, :view
  alias ContactWeb.Api.ColorThemeView

  def render("index.json", %{color_themes: color_themes}) do
    %{data: render_many(color_themes, ColorThemeView, "color_theme.json")}
  end

  def render("show.json", %{color_theme: color_theme}) do
    %{data: render_one(color_theme, ColorThemeView, "color_theme.json")}
  end

  def render("color_theme.json", %{color_theme: color_theme}) do
    %{id: color_theme.id,
      updated_at_timestamp_utc: color_theme.updated_at_timestamp_utc,
      updated_at_clock_count: color_theme.updated_at_clock_count,
      updated_by_uri: color_theme.updated_by_uri,
      tenant_uri: color_theme.tenant_uri,
      type_uri: color_theme.type_uri,
      state_uri: color_theme.state_uri,
      primary_color_id: color_theme.primary_color_id,
      secondary_color_id: color_theme.secondary_color_id,
      tertiary_color_id: color_theme.tertiary_color_id,
      success_color_id: color_theme.success_color_id,
      failure_color_id: color_theme.failure_color_id,
      light_color_id: color_theme.light_color_id,
      dark_color_id: color_theme.dark_color_id,
      safety_color_id: color_theme.safety_color_id,
      caution_color_id: color_theme.caution_color_id,
      warning_color_id: color_theme.warning_color_id,
      danger_color_id: color_theme.danger_color_id,
      rag_status_r_color_id: color_theme.rag_status_r_color_id,
      rag_status_a_color_id: color_theme.rag_status_a_color_id,
      rag_status_g_color_id: color_theme.rag_status_g_color_id}
  end
end
