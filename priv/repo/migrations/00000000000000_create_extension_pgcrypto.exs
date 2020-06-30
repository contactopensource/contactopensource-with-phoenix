defmodule CommissaryPhoenix.Repo.Migrations.CreateExtensionPGCrypto do
  @moduledoc "Create extension \"pgcrypto\" so Postgres can generate its own binary UUIDs"
  use Ecto.Migration

  def change do
    execute(
      "CREATE EXTENSION IF NOT EXISTS \"pgcrypto\"",
      "DROP EXTENSION IF EXISTS \"pgcrypto\""
    )
  end
end
