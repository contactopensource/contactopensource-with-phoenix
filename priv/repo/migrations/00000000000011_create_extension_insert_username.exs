defmodule CommissaryPhoenix.Repo.Migrations.AddInsertUsername do
  @moduledoc "Add insert_username so Postgres can track who modifies"
  use Ecto.Migration

  def change do
    execute(
      "CREATE EXTENSION IF NOT EXISTS \"insert_username\"",
      "DROP EXTENSION IF EXISTS \"insert_username\""
    )
  end
end
