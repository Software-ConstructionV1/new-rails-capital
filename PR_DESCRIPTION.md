# Pull Request Description

## Resource Creation Summary
Added a new `Book` resource manually with:
- `config/routes.rb` updated to register `resources :books` and set root to `books#index`
- `app/models/book.rb` with Active Record validations for `title` and `author`
- `app/controllers/books_controller.rb` with full CRUD actions
- `app/views/books/*` templates including index, show, new, edit, and a shared form partial
- `db/migrate/20260620120000_create_books.rb` to create the `books` table with columns `title`, `author`, and `description`

Each part of the resource was committed separately to keep the implementation modular and easy to review.

## Active Record Pattern vs Repository Pattern
The Active Record pattern is the default persistence approach in Ruby on Rails. In this pattern, domain objects (models) are also responsible for database operations. That means `Book` objects can perform queries, create records, and update themselves directly through methods like `save`, `update`, and `destroy`.

Advantages of Active Record:
- Simpler and more direct for typical CRUD applications
- Tight integration with Rails conventions and tooling
- Less boilerplate code for standard persistence needs

Trade-offs:
- Application logic and persistence logic can become intertwined
- Harder to isolate persistence for unit testing without touching the database
- Domain objects become coupled to Active Record APIs and the relational database schema

The Repository Pattern separates data access into its own layer. Instead of models handling persistence directly, repositories expose methods such as `find`, `save`, and `delete` and delegate storage concerns to specialized classes.

Advantages of Repository Pattern:
- Better separation of concerns between domain logic and persistence
- Easier to swap storage backends or implement different data access strategies
- Improved testability by mocking repositories instead of the database

Trade-offs:
- More code and abstractions to maintain
- May duplicate functionality already built into Active Record
- Less idiomatic in Rails applications unless the domain complexity justifies it

## Rails Migrations Summary
Ruby on Rails migrations provide a versioned, Ruby-based way to evolve the database schema over time.

Key learnings:
- Migrations are incremental and timestamped, allowing schema changes to be applied in a defined order across environments
- Each migration expresses schema changes in a readable DSL, such as `create_table`, `add_column`, and `remove_index`
- Migrations support reversal through the `change` method or explicit `up`/`down` methods, making rollbacks safer
- Rails keeps track of which migrations have run in the `schema_migrations` table
- The Rails schema (`schema.rb`) can be regenerated from migrations, providing a canonical representation of the current structure

Why migrations matter:
- They make database changes part of application version control
- They help teammates and deployment environments stay synchronized
- They provide a documented history of how the data model evolved over time
