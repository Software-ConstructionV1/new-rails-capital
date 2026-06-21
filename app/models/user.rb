class User < ApplicationRecord
  has_many :posts, foreign_key: "creator_id"
  validates :name, presence: true
  validates :email, presence: true
  has_many :post_editings, foreign_key: "post_editor_id"
  has_many :edited_posts, through: :post_editings, source: :edited_post
end
