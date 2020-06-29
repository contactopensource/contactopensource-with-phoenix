defmodule CommissaryPhoenix.Repo.Migrations.CreateExtensionPgStatStatements do
  @moduledoc "Create extension \"pg_stat_statements\" so Postgres can track execution statistics"
  use Ecto.Migration

  def change do
    execute(
      "CREATE EXTENSION IF NOT EXISTS \"pg_stat_statements\"",
      "DROP EXTENSION IF EXISTS \"pg_stat_statements\""
    )
  end
end
