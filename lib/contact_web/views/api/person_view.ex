defmodule ContactWeb.Api.PersonView do
  use ContactWeb, :view
  alias ContactWeb.Api.PersonView

  def render("index.json", %{persons: persons}) do
    %{data: render_many(persons, PersonView, "person.json")}
  end

  def render("show.json", %{person: person}) do
    %{data: render_one(person, PersonView, "person.json")}
  end

  def render("person.json", %{person: person}) do
    %{id: person.id,
      tenant_id: person.tenant_id,
      type_uri: person.type_uri,
      type_text: person.type_text,
      state_uri: person.state_uri,
      state_text: person.state_text,
      updated_at_timestamp_utc: person.updated_at_timestamp_utc,
      updated_at_clock_count: person.updated_at_clock_count,
      updated_by_text: person.updated_by_text}
  end
end
