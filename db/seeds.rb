# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing data first
PostEditor.destroy_all
Post.destroy_all
Editor.destroy_all
User.destroy_all

# Create Users
user1 = User.create!(
  name: "John Doe",
  dob: "1990-01-01",
  email: "john@email.com",
  phone_number: "1234567890"
)

user2 = User.create!(
  name: "Jane Smith",
  dob: "1992-05-15",
  email: "jane@email.com",
  phone_number: "0987654321"
)

user3 = User.create!(
  name: "Bob Wilson",
  dob: "1988-03-20",
  email: "bob@email.com",
  phone_number: "1122334455"
)

# Create Editors
editor1 = Editor.create!(
  name: "Editor Alice",
  email: "alice@email.com"
)

editor2 = Editor.create!(
  name: "Editor Mike",
  email: "mike@email.com"
)

editor3 = Editor.create!(
  name: "Editor Sarah",
  email: "sarah@email.com"
)

# Create Posts (with creator)
# Create Posts (with creator)
post1 = Post.create!(
  title: "First Post",
  content: "This is the content of the first post",
  user_id: user1.id
)

post2 = Post.create!(
  title: "Second Post",
  content: "This is the content of the second post",
  user_id: user1.id
)

post3 = Post.create!(
  title: "Third Post",
  content: "This is the content of the third post",
  user_id: user2.id
)

post4 = Post.create!(
  title: "Fourth Post",
  content: "This is the content of the fourth post",
  user_id: user3.id
)

# Assign Editors to Posts (join table)
PostEditor.create!(post: post1, editor: editor1)
PostEditor.create!(post: post1, editor: editor2)  

PostEditor.create!(post: post2, editor: editor2)
PostEditor.create!(post: post2, editor: editor3)

PostEditor.create!(post: post3, editor: editor1)
PostEditor.create!(post: post3, editor: editor3) 

PostEditor.create!(post: post4, editor: editor1)  

puts "Created #{User.count} users"
puts "Created #{Editor.count} editors"
puts "Created #{Post.count} posts"
puts "Created #{PostEditor.count} post editor assignments"