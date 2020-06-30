defmodule CommissaryPhoenix.Repo.Migrations.CreateExtensionInsertUsername do
  @moduledoc "Create extension \"insert_username\" so Postgres can track who modifies what"
  use Ecto.Migration

  def change do
    execute(
      "CREATE EXTENSION IF NOT EXISTS \"insert_username\"",
      "DROP EXTENSION IF EXISTS \"insert_username\""
    )
  end
end
