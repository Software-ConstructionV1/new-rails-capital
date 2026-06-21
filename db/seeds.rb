user1 = User.create!(name: "Rana", dob: "2000-01-01", email: "rana@test.com", phone_number: "01012345678")
user2 = User.create!(name: "Ahmed", dob: "1999-05-15", email: "ahmed@test.com", phone_number: "01098765432")
user3 = User.create!(name: "Sara", dob: "2001-03-20", email: "sara@test.com", phone_number: "01055555555")

post1 = Post.create!(title: "first post", content: "hello", user: user1, creator: user1)
post2 = Post.create!(title: "second post", content: "world", user: user2, creator: user1)

PostEditor.create!(post: post1, editor: user2)
PostEditor.create!(post: post1, editor: user3)
PostEditor.create!(post: post2, editor: user1)
