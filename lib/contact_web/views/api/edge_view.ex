defmodule ContactWeb.Api.EdgeView do
  use ContactWeb, :view
  alias ContactWeb.Api.EdgeView

  def render("index.json", %{edges: edges}) do
    %{data: render_many(edges, EdgeView, "edge.json")}
  end

  def render("show.json", %{edge: edge}) do
    %{data: render_one(edge, EdgeView, "edge.json")}
  end

  def render("edge.json", %{edge: edge}) do
    %{id: edge.id,
      tenant_id: edge.tenant_id,
      type_uri: edge.type_uri,
      type_text: edge.type_text,
      state_uri: edge.state_uri,
      state_text: edge.state_text,
      updated_at_timestamp_utc: edge.updated_at_timestamp_utc,
      updated_at_clock_count: edge.updated_at_clock_count,
      updated_by_text: edge.updated_by_text,
      subject_uri: edge.subject_uri,
      subject_database: edge.subject_database,
      subject_schema: edge.subject_schema,
      subject_table: edge.subject_table,
      subject_id: edge.subject_id,
      predicate_uri: edge.predicate_uri,
      predicate_database: edge.predicate_database,
      predicate_schema: edge.predicate_schema,
      predicate_table: edge.predicate_table,
      predicate_id: edge.predicate_id,
      object_uri: edge.object_uri,
      object_database: edge.object_database,
      object_schema: edge.object_schema,
      object_table: edge.object_table,
      object_id: edge.object_id,
      start_at_timestamp_utc: edge.start_at_timestamp_utc,
      stop_at_timestamp_utc: edge.stop_at_timestamp_utc,
      count: edge.count,
      weight: edge.weight,
      unit_interval: edge.unit_interval,
      dual_interval: edge.dual_interval,
    }
  end
end
