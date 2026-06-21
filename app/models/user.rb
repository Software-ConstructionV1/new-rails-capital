class User < ApplicationRecord
  # 1:M — a user (creator) has many posts
  has_many :posts, foreign_key: :creator_id, inverse_of: :creator, dependent: :nullify

  # M:M — a user edits many posts through the manual join table
  has_many :post_editors, foreign_key: :editor_id, inverse_of: :editor, dependent: :destroy
  has_many :edited_posts, through: :post_editors, source: :post
end
