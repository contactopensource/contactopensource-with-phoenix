defmodule CommissaryPhoenix.Repo.Migrations.AddTrigram do
  @moduledoc "Add Trigram so Postgres can search similar text"
  use Ecto.Migration

  def change do
    execute(
      "CREATE EXTENSION IF NOT EXISTS \"pg_trgm\"",
      "DROP EXTENSION IF EXISTS \"pg_trgm\""
    )
  end
end
