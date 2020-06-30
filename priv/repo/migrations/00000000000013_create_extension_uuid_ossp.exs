defmodule CommissaryPhoenix.Repo.Migrations.CreateExtensionUUIDOSSP do
  @moduledoc "Create extension \"uuid-ossp\" so Postgres learns universally unique identifiers"
  use Ecto.Migration

  def change do
    execute(
      "CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\"",
      "DROP EXTENSION IF EXISTS \"uuid-ossp\""
    )
  end
end
