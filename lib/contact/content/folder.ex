defmodule Contact.Content.Folder do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "folders" do
    field :codec_id, Ecto.UUID
    field :created_at_clock_count, :integer
    field :created_at_timestamp_utc, :naive_datetime
    field :locale_id, Ecto.UUID
    field :media_type_id, Ecto.UUID
    field :saga, :string
    field :state_uri, :string
    field :subtitle, :string
    field :summary, :string
    field :tenant_uri, :string
    field :title, :string
    field :type_uri, :string
    field :updated_at_clock_count, :integer
    field :updated_at_timestamp_utc, :naive_datetime
    field :updated_by_uri, :string

    timestamps()
  end

  @doc false
  def changeset(folder, attrs) do
    folder
    |> cast(attrs, [:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :locale_id, :media_type_id, :codec_id, :title, :subtitle, :summary, :saga])
    |> validate_required([:created_at_timestamp_utc, :created_at_clock_count, :updated_at_timestamp_utc, :updated_at_clock_count, :updated_by_uri, :tenant_uri, :type_uri, :state_uri, :locale_id, :media_type_id, :codec_id, :title, :subtitle, :summary, :saga])
  end
end
