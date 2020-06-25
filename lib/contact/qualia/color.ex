defmodule Contact.Qualia.Color do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "colors" do
    field :color_naming_system_name, :string
    field :cymk_unit_interval_c, :decimal
    field :cymk_unit_interval_k, :decimal
    field :cymk_unit_interval_m, :decimal
    field :cymk_unit_interval_y, :decimal
    field :hex, :string
    field :html_color_name, :string
    field :pantone_matching_system_name, :string
    field :rgb_unit_interval_b, :decimal
    field :rgb_unit_interval_g, :decimal
    field :rgb_unit_interval_r, :decimal
    field :state_uri, :string
    field :tenant_uri, :string
    field :type_uri, :string
    field :updated_at_clock_count, :integer
    field :updated_at_timestamp_utc, :naive_datetime
    field :updated_by_uri, :string
    field :x11_color_name, :string

    timestamps()
  end

  @doc false
  def changeset(color, attrs) do
    color
    |> cast(attrs, [:updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :rgb_unit_interval_r, :rgb_unit_interval_g, :rgb_unit_interval_b, :cymk_unit_interval_c, :cymk_unit_interval_y, :cymk_unit_interval_m, :cymk_unit_interval_k, :hex, :html_color_name, :x11_color_name, :color_naming_system_name, :pantone_matching_system_name])
    |> validate_required([:updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :rgb_unit_interval_r, :rgb_unit_interval_g, :rgb_unit_interval_b, :cymk_unit_interval_c, :cymk_unit_interval_y, :cymk_unit_interval_m, :cymk_unit_interval_k, :hex, :html_color_name, :x11_color_name, :color_naming_system_name, :pantone_matching_system_name])
  end
end
