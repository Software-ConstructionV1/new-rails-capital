class User < ApplicationRecord
  has_many :posts
  has_many :created_posts, class_name: "Post", foreign_key: "creator_id"
  has_many :post_editors, foreign_key: "editor_id"
  has_many :editable_posts, through: :post_editors, source: :post
end
