# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Posteditor.destroy_all()
Post.destroy_all()
User.destroy_all()
Editor.destroy_all()

User.create(name: "sdajf;", age: 12)
User.create(name: "iafo", age: 12)
User.create(name: "abdelhaq", age: 100)

Post.create(title: "first", content: "kjsfa", user_id: 1)
Post.create(title: "second", content: "knsdlfka", user_id: 2)
Post.create(title: "third", content: "nasfoi", user_id: 3)

Editor.create(name: "third", email: "nasfoi", age: 45)
Editor.create(name: "third", email: "nasfoi", age: 31)
Editor.create(name: "third", email: "nasfoi", age: 21)