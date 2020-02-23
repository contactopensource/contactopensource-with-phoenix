defmodule ContactWeb.Api.NodeView do
  use ContactWeb, :view
  alias ContactWeb.Api.NodeView

  def render("index.json", %{nodes: nodes}) do
    %{data: render_many(nodes, NodeView, "node.json")}
  end

  def render("show.json", %{node: node}) do
    %{data: render_one(node, NodeView, "node.json")}
  end

  def render("node.json", %{node: node}) do
    %{id: node.id,
      tenant_id: node.tenant_id,
      type_uri: node.type_uri,
      type_text: node.type_text,
      state_uri: node.state_uri,
      state_text: node.state_text,
      updated_at_timestamp_utc: node.updated_at_timestamp_utc,
      updated_at_clock_count: node.updated_at_clock_count,
      updated_by_text: node.updated_by_text,
      text: node.text,
      json: node.json,
      xml: node.xml,
      number: node.number}
  end
end
