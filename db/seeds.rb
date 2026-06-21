# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user1 = User.create!(name: "Alice", dob: "1990-01-01", email: "alice@example.com", phone_number: "1234567890", address: "123 Main St")
user2 = User.create!(name: "Bob", dob: "1992-05-15", email: "bob@example.com", phone_number: "0987654321", address: "456 Oak Ave")

editor1 = Editor.create!(name: "Eve")
editor2 = Editor.create!(name: "Frank")

post1 = Post.create!(title: "First Post", content: "Hello world", creator: user1)
post2 = Post.create!(title: "Second Post", content: "More content", creator: user2)

post1.editors << editor1
post1.editors << editor2
post2.editors << editor1