# Contact

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix


## Implementation


### Generators

We use generators that are simple shell scripts:

* [db/generators/](db/generataors/)

Our goal for the generators is to start a new project with approximately what we want, so then we can fine-tune it.

Phoenix generators can use Elixir types, but not all PostgreSQL types:
  
* Generator type `integer` instead of PostgreSQL type `bigint`.

* Generator type `naive_datetime` instead of PostgreSQL type `timestamp`. This is because the Ecto default is the `naive_datetime` type, and we want to use the Ecto default.

* Generator type `map` instead of PostgreSQL type `jsonb`.

* Generator type `text` instead of PostgreSQL type `xml`.

We prefer to not use the generator type `references`, because we prefer to not have Ecto create foreign key contraints, because we prefer the constraints in the application logic instead of in the database.

