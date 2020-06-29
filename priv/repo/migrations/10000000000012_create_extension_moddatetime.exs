defmodule CommissaryPhoenix.Repo.Migrations.AddModDateTime do
  @moduledoc "Add moddatetime so Postgres can do modification timestamps"
  use Ecto.Migration

  def change do
    execute(
      "CREATE EXTENSION IF NOT EXISTS \"moddatetime\"",
      "DROP EXTENSION IF EXISTS \"moddatetime\""
    )
  end
end
