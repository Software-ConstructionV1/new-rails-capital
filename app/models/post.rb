class Post < ApplicationRecord
  # One-to-Many: every post is made by ONE creator (a User).
  belongs_to :creator, class_name: "User"

  # Many-to-Many: a post can have MANY editors (Users), through our join table.
  has_many :post_editors, dependent: :destroy
  has_many :editors, through: :post_editors
end
