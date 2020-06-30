defmodule CommissaryPhoenix.Repo.Migrations.CreateExtensionFuzzyStrMatch do
  @moduledoc "Create extension \"fuzzystrmatch\" so Postgres learns to fuzzy string match Levenshtein similarity"
  use Ecto.Migration

  def change do
    execute(
      "CREATE EXTENSION IF NOT EXISTS \"fuzzystrmatch\"",
      "DROP EXTENSION IF EXISTS \"fuzzystrmatch\""
    )
  end
end
