defmodule CommissaryPhoenix.Repo.Migrations.AddFuzzyMatch do
  @moduledoc "Add Fuzzy Match so Postgres learns Levenshtein similarity"
  use Ecto.Migration

  def change do
    execute(
      "CREATE EXTENSION IF NOT EXISTS \"fuzzystrmatch\"",
      "DROP EXTENSION IF EXISTS \"fuzzystrmatch\""
    )
  end
end
