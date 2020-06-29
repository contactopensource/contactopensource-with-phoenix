defmodule CommissaryPhoenix.Repo.Migrations.AddLabelTree do
  @moduledoc "Add label tree so Postgres can represent hierarchies"
  use Ecto.Migration

  def change do
    execute(
      "CREATE EXTENSION IF NOT EXISTS \"ltree\"",
      "DROP EXTENSION IF EXISTS \"ltree\""
    )
  end
end
