defmodule CommissaryPhoenix.Repo.Migrations.CreateExtensionUnaccent do
  @moduledoc "Create extension \"unaccent\" so Postgres can search text more broadly"
  use Ecto.Migration

  def change do
    execute(
      "CREATE EXTENSION IF NOT EXISTS \"unaccent\"",
      "DROP EXTENSION IF EXISTS \"unaccent\""
    )
  end
end
