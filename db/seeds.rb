# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Post.destroy_all
PostEditing.destroy_all


ahmed = User.create!(name: "Ahmed", email: "ahmed@email.com")
mohamed = User.create!(name: "Mohamed", email: "mohamed@email.com")


post1 = Post.create!(title: "T1",   content: "zvcxzcvx.", creator: ahmed)

post2 = mohamed.posts.create!(title: "T2", content: "qweqwewq")

ahmed.post_editings.create(edited_post: post1)
mohamed.post_editings.create(edited_post: post1)
