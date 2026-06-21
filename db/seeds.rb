# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


PostEditor.delete_all
Post.delete_all
User.delete_all

users = 5.times.map do |i|
  User.create!(name: "User #{i + 1}", email: "user#{i + 1}@example.com", address: "Address for user #{i + 1}")
end

posts = 10.times.map do |i|
  Post.create!(title: "Post #{i + 1}", content: "Content for post #{i + 1}", creator: users.sample)
end

posts.each do |post|
  editors = users.sample(rand(1..5))
  editors.each do |editor|
    PostEditor.create!(post: post, editor: editor)
  end
end

puts "Seeded #{User.count} users, #{Post.count} posts, and #{PostEditor.count} post editors."