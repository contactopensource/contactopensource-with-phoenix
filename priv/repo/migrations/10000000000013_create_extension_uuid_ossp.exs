defmodule CommissaryPhoenix.Repo.Migrations.AddUuidOssp do
  @moduledoc "Add UUID-OSSP so Postgres leaers universally unique identifiers"
  use Ecto.Migration

  def change do
    execute(
      "CREATE EXTENSION IF NOT EXISTS \"tablefunc\"",
      "DROP EXTENSION IF EXISTS \"tablefunc\""
    )
  end
end
