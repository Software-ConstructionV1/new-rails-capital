# Create Users
user1 = User.create!(name: "Alice", email: "alice@example.com")
user2 = User.create!(name: "Bob", email: "bob@example.com")

# Create Posts
post1 = Post.create!(title: "First Post", body: "Hello World", user: user1, creator: user1)
post2 = Post.create!(title: "Second Post", body: "Rails is great", user: user2, creator: user2)

# Create Editors
editor1 = Editor.create!(name: "Carol", email: "carol@example.com")
editor2 = Editor.create!(name: "Dave", email: "dave@example.com")

# Link Editors to Posts (Many-to-Many)
PostEditor.create!(post: post1, editor: editor1)
PostEditor.create!(post: post1, editor: editor2)
PostEditor.create!(post: post2, editor: editor1)

puts "Seeding done!"