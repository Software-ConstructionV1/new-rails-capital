class Post < ApplicationRecord
  belongs_to :user
  belongs_to :creator, class_name: "User", inverse_of: :created_posts

  has_many :post_editors, dependent: :destroy
  has_many :editors, through: :post_editors

  validates :title, :content, presence: true
end
