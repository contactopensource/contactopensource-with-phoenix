defmodule ContactWeb.Api.LocaleView do
  use ContactWeb, :view
  alias ContactWeb.Api.LocaleView

  def render("index.json", %{locales: locales}) do
    %{data: render_many(locales, LocaleView, "locale.json")}
  end

  def render("show.json", %{locale: locale}) do
    %{data: render_one(locale, LocaleView, "locale.json")}
  end

  def render("locale.json", %{locale: locale}) do
    %{id: locale.id,
      tenant_id: locale.tenant_id,
      type_uri: locale.type_uri,
      type_text: locale.type_text,
      state_uri: locale.state_uri,
      state_text: locale.state_text,
      updated_at_timestamp_utc: locale.updated_at_timestamp_utc,
      updated_at_clock_count: locale.updated_at_clock_count,
      updated_by_text: locale.updated_by_text,
      text: locale.text,
      language_code: locale.language_code,
      country_code: locale.country_code,
      script_code: locale.script_code,
      region_code: locale.region_code,
      variant_code: locale.variant_code,
      decimal_separator: locale.decimal_separator,
      grouping_separator: locale.grouping_separator,
      currency_code: locale.currency_code,
      currency_symbol: locale.currency_symbol,
      quotation_start_delimiter: locale.quotation_start_delimiter,
      quotation_stop_delimiter: locale.quotation_stop_delimiter}
  end
end
