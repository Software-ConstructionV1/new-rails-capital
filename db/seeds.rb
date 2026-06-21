# Seed data for Users, Posts (1:M creator) and Editors (M:M via post_editors).
# Idempotent: clears the join + dependent records first.
PostEditor.delete_all
Post.delete_all
User.delete_all

ada   = User.create!(name: "Ada Lovelace", dob: "1815-12-10", email: "ada@example.com",   phone_number: "0100000001")
alan  = User.create!(name: "Alan Turing",  dob: "1912-06-23", email: "alan@example.com",  phone_number: "0100000002")
grace = User.create!(name: "Grace Hopper", dob: "1906-12-09", email: "grace@example.com", phone_number: "0100000003")

# 1:M — each post has a creator
post1 = Post.create!(title: "Analytical Engine",   content: "Notes on Bernoulli numbers.", creator: ada)
post2 = Post.create!(title: "Computing Machinery", content: "Can machines think?",         creator: alan)
post3 = Post.create!(title: "COBOL",               content: "Compilers for the masses.",   creator: grace)

# M:M — assign editors (Users) to posts through the manual join table
post1.editors << [alan, grace]
post2.editors << [ada]
post3.editors << [ada, alan]

puts "Seeded #{User.count} users, #{Post.count} posts, #{PostEditor.count} post-editor links."
