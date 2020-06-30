defmodule CommissaryPhoenix.Repo.Migrations.CreateExtensionLO do
  @moduledoc "Create extension \"lo\" so Postgres can handle large objects such as streaming big blobs"
  use Ecto.Migration

  def change do
    execute(
      "CREATE EXTENSION IF NOT EXISTS \"lo\"",
      "DROP EXTENSION IF EXISTS \"lo\""
    )
  end
end
