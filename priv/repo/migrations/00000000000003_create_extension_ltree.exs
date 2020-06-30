defmodule CommissaryPhoenix.Repo.Migrations.CreateExtensionLTree do
  @moduledoc "Create extension \"ltree\" so Postgres can represent label tree hierarchies"
  use Ecto.Migration

  def change do
    execute(
      "CREATE EXTENSION IF NOT EXISTS \"ltree\"",
      "DROP EXTENSION IF EXISTS \"ltree\""
    )
  end
end
