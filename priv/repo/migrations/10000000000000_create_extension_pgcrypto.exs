defmodule CommissaryPhoenix.Repo.Migrations.AddPgcrypto do
  @moduledoc "Add PgCrypto so Postgres can generate its own binary UUIDs"
  use Ecto.Migration

  def change do
    execute(
      "CREATE EXTENSION IF NOT EXISTS \"pgcrypto\"",
      "DROP EXTENSION IF EXISTS \"pgcrypto\""
    )
  end
end
