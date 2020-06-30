defmodule CommissaryPhoenix.Repo.Migrations.AddAutoinc do
  @moduledoc "Add autoinc so Postgres can automatically increment"
  use Ecto.Migration

  def change do
    execute(
      "CREATE EXTENSION IF NOT EXISTS \"autoinc\"",
      "DROP EXTENSION IF EXISTS \"autoinc\""
    )
  end
end
