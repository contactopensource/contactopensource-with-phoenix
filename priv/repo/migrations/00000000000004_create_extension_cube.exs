defmodule CommissaryPhoenix.Repo.Migrations.CreateExtensionCube do
  @moduledoc "Create extension \"cube\" so Postgres can use a data type to represent dimensions"
  use Ecto.Migration

  def change do
    execute(
      "CREATE EXTENSION IF NOT EXISTS \"cube\"",
      "DROP EXTENSION IF EXISTS \"cube\""
    )
  end
end
