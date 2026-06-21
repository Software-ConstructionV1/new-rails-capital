# Seed data for the One-to-Many (creator) and Many-to-Many (editors) relationships.
# Run with:  bin/rails db:seed
#
# We clear old data first so this file can be run again and again safely.
PostEditor.destroy_all
Post.destroy_all
User.destroy_all

# --- Users ---
alice = User.create!(name: "Alice", dob: "1995-04-12", email: "alice@example.com", phone_number: "01000000001")
bob   = User.create!(name: "Bob",   dob: "1992-08-30", email: "bob@example.com",   phone_number: "01000000002")
carol = User.create!(name: "Carol", dob: "1998-01-05", email: "carol@example.com", phone_number: "01000000003")

# --- Posts ---
# One-to-Many: each post has exactly ONE creator.
post1 = Post.create!(title: "Hello Rails",       content: "My very first post.",        creator: alice)
post2 = Post.create!(title: "Associations 101",  content: "1:M and M:M, explained.",     creator: alice)
post3 = Post.create!(title: "Bob's Notes",       content: "Some thoughts to share.",     creator: bob)

# --- Editors ---
# Many-to-Many: a post can have MANY editors, and a user can edit MANY posts.
# We add the links directly to our join table (post_editors).
PostEditor.create!(post: post1, editor: bob)
PostEditor.create!(post: post1, editor: carol)
PostEditor.create!(post: post2, editor: carol)
PostEditor.create!(post: post3, editor: alice)

puts "Seeded #{User.count} users, #{Post.count} posts, and #{PostEditor.count} editor links."
