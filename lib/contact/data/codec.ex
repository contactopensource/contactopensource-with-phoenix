defmodule Contact.Data.Codec do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "codecs" do
    field :bit_rate, :decimal
    field :bit_rate_maximum, :decimal
    field :bit_rate_minimum, :decimal
    field :channel_count, :integer
    field :channel_count_maximum, :integer
    field :channel_count_minimum, :integer
    field :code, :string
    field :created_at_clock_count, :integer
    field :created_at_timestamp_utc, :naive_datetime
    field :creator_name, :string
    field :floss_flag, :boolean, default: false
    field :icon, :string
    field :link, :string
    field :lossy_flag, :boolean, default: false
    field :name, :string
    field :note, :string
    field :parent_id, Ecto.UUID
    field :prefer_file_extension, :string
    field :prefer_media_type_id, Ecto.UUID
    field :set_id, Ecto.UUID
    field :state_uri, :string
    field :tenant_uri, :string
    field :type_uri, :string
    field :updated_at_clock_count, :integer
    field :updated_at_timestamp_utc, :naive_datetime
    field :updated_by_uri, :string
    field :variable_bit_rate_flag, :boolean, default: false
    field :variable_channel_count_flag, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(codec, attrs) do
    codec
    |> cast(attrs, [:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :set_id, :parent_id, :name, :code, :icon, :link, :note, :creator_name, :prefer_file_extension, :prefer_media_type_id, :lossy_flag, :floss_flag, :bit_rate, :bit_rate_minimum, :bit_rate_maximum, :variable_bit_rate_flag, :channel_count, :channel_count_minimum, :channel_count_maximum, :variable_channel_count_flag])
    |> validate_required([:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :set_id, :parent_id, :name, :code, :icon, :link, :note, :creator_name, :prefer_file_extension, :prefer_media_type_id, :lossy_flag, :floss_flag, :bit_rate, :bit_rate_minimum, :bit_rate_maximum, :variable_bit_rate_flag, :channel_count, :channel_count_minimum, :channel_count_maximum, :variable_channel_count_flag])
  end
end
