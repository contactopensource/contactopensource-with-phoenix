defmodule CommissaryPhoenix.Repo.Migrations.CreateExtensionTablefunc do
  @moduledoc "Create extension \"tablefunc\" so Postgres learns table functions"
  use Ecto.Migration

  def change do
    execute(
      "CREATE EXTENSION IF NOT EXISTS \"tablefunc\"",
      "DROP EXTENSION IF EXISTS \"tablefunc\""
    )
  end
end
