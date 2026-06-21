class Post < ApplicationRecord
  # 1:M — each post is created by one User (creator)
  belongs_to :creator, class_name: "User", optional: true

  # M:M — a post has many editors (Users) through the manual join table
  has_many :post_editors, dependent: :destroy
  has_many :editors, through: :post_editors, source: :editor
end
