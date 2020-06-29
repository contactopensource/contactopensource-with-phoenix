defmodule CommissaryPhoenix.Repo.Migrations.AddCube do
  @moduledoc "Add cube data type so Postgres can represent dimensions"
  use Ecto.Migration

  def change do
    execute(
      "CREATE EXTENSION IF NOT EXISTS \"cube\"",
      "DROP EXTENSION IF EXISTS \"cube\""
    )
  end
end
