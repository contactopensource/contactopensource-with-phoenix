defmodule ContactWeb.Api.LinkContactView do
  use ContactWeb, :view
  alias ContactWeb.Api.LinkContactView

  def render("index.json", %{link_contacts: link_contacts}) do
    %{data: render_many(link_contacts, LinkContactView, "link_contact.json")}
  end

  def render("show.json", %{link_contact: link_contact}) do
    %{data: render_one(link_contact, LinkContactView, "link_contact.json")}
  end

  def render("link_contact.json", %{link_contact: link_contact}) do
    %{id: link_contact.id,
      tenant_id: link_contact.tenant_id,
      type_uri: link_contact.type_uri,
      type_text: link_contact.type_text,
      state_uri: link_contact.state_uri,
      state_text: link_contact.state_text,
      updated_at_timestamp_utc: link_contact.updated_at_timestamp_utc,
      updated_at_clock_count: link_contact.updated_at_clock_count,
      updated_by_text: link_contact.updated_by_text,
      label: link_contact.label,
      uri: link_contact.uri}
  end
end
