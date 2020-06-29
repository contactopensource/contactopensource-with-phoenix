defmodule CommissaryPhoenix.Repo.Migrations.AddLargeObjects do
  @moduledoc "Add large objects so Postgres can stream big blobs"
  use Ecto.Migration

  def change do
    execute(
      "CREATE EXTENSION IF NOT EXISTS \"lo\"",
      "DROP EXTENSION IF EXISTS \"lo\""
    )
  end
end
