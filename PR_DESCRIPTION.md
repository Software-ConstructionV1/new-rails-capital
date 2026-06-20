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

## Ruby Object Model Summary
Ruby models are objects created from classes, and every value in Ruby is an object. Objects encapsulate state in instance variables and behavior in methods. The Ruby object model supports inheritance, mixins, singleton methods, and dynamic method lookup, which means classes are themselves objects and can be modified at runtime.

Key points:
- Classes are objects of class `Class`; metaprogramming is a first-class feature.
- Instance variables belong to objects, while class variables are shared across a class hierarchy.
- Method lookup walks the inheritance chain and included modules, enabling flexible behavior composition.
- Singleton classes allow objects to have methods defined only on a single instance.

This model emphasizes that code and data are unified: methods can be added or overridden dynamically, and objects can acquire new behavior through modules or singleton methods.

## Ruby Modules Summary
Ruby modules are reusable containers for methods, constants, and nested classes or modules. They cannot be instantiated directly but can be included or extended into classes or objects to share behavior.

Key points:
- `include` mixes module instance methods into a class, allowing objects of that class to call them.
- `extend` adds module methods as singleton methods to a class or object, which is useful for module-level utilities.
- Modules support namespacing to organize code and avoid constant name collisions.
- Modules can also be used as mixins to implement shared behavior without the complexity of multiple inheritance.

Modules are a core Ruby abstraction for composition and code reuse. They help keep the object hierarchy clean while enabling shared behavior across unrelated classes.
