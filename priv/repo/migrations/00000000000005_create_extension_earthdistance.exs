defmodule CommissaryPhoenix.Repo.Migrations.CreateExtensionEarthDistance do
  @moduledoc "Create extension \"earthdistance\" so Postgres can calculate with geography"
  use Ecto.Migration

  def change do
    execute(
      "CREATE EXTENSION IF NOT EXISTS \"earthdistance\"",
      "DROP EXTENSION IF EXISTS \"earthdistance\""
    )
  end
end
