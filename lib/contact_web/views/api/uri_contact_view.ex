defmodule ContactWeb.Api.UriContactView do
  use ContactWeb, :view
  alias ContactWeb.Api.UriContactView

  def render("index.json", %{uri_contacts: uri_contacts}) do
    %{data: render_many(uri_contacts, UriContactView, "uri_contact.json")}
  end

  def render("show.json", %{uri_contact: uri_contact}) do
    %{data: render_one(uri_contact, UriContactView, "uri_contact.json")}
  end

  def render("uri_contact.json", %{uri_contact: uri_contact}) do
    %{id: uri_contact.id,
      tenant_id: uri_contact.tenant_id,
      type_uri: uri_contact.type_uri,
      type_text: uri_contact.type_text,
      state_uri: uri_contact.state_uri,
      state_text: uri_contact.state_text,
      updated_at_timestamp_utc: uri_contact.updated_at_timestamp_utc,
      updated_at_clock_count: uri_contact.updated_at_clock_count,
      updated_by_text: uri_contact.updated_by_text,
      label: uri_contact.label,
      uri: uri_contact.uri}
  end
end
