class User < ApplicationRecord
  # One-to-Many: a user (as the creator) can create MANY posts.
  has_many :posts, foreign_key: "creator_id", dependent: :destroy, inverse_of: :creator

  # Many-to-Many: a user (as an editor) can edit MANY posts, through our join table.
  has_many :post_editors, foreign_key: "editor_id", dependent: :destroy, inverse_of: :editor
  has_many :edited_posts, through: :post_editors, source: :post
end
