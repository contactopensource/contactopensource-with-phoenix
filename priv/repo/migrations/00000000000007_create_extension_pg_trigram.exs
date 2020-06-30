defmodule CommissaryPhoenix.Repo.Migrations.CreateExtensionPgTrigram do
  @moduledoc "Create extension \"pg_trigram\" so Postgres can search similar text"
  use Ecto.Migration

  def change do
    execute(
      "CREATE EXTENSION IF NOT EXISTS \"pg_trgm\"",
      "DROP EXTENSION IF EXISTS \"pg_trgm\""
    )
  end
end
