defmodule Contact.ColorTheme do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "color_themes" do
    field :caution_color_id, Ecto.UUID
    field :created_at_clock_count, :integer
    field :created_at_timestamp_utc, :naive_datetime
    field :danger_color_id, Ecto.UUID
    field :dark_color_id, Ecto.UUID
    field :failure_color_id, Ecto.UUID
    field :light_color_id, Ecto.UUID
    field :primary_color_id, Ecto.UUID
    field :rag_status_a_color_id, Ecto.UUID
    field :rag_status_g_color_id, Ecto.UUID
    field :rag_status_r_color_id, Ecto.UUID
    field :safety_color_id, Ecto.UUID
    field :secondary_color_id, Ecto.UUID
    field :state_uri, :string
    field :success_color_id, Ecto.UUID
    field :tenant_uri, :string
    field :tertiary_color_id, Ecto.UUID
    field :type_uri, :string
    field :updated_at_clock_count, :integer
    field :updated_at_timestamp_utc, :naive_datetime
    field :updated_by_uri, :string
    field :warning_color_id, Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(color_theme, attrs) do
    color_theme
    |> cast(attrs, [:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :primary_color_id, :secondary_color_id, :tertiary_color_id, :success_color_id, :failure_color_id, :light_color_id, :dark_color_id, :safety_color_id, :caution_color_id, :warning_color_id, :danger_color_id, :rag_status_r_color_id, :rag_status_a_color_id, :rag_status_g_color_id])
    |> validate_required([:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :primary_color_id, :secondary_color_id, :tertiary_color_id, :success_color_id, :failure_color_id, :light_color_id, :dark_color_id, :safety_color_id, :caution_color_id, :warning_color_id, :danger_color_id, :rag_status_r_color_id, :rag_status_a_color_id, :rag_status_g_color_id])
  end
end
