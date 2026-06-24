class Post < ApplicationRecord
  # 1:M 
  belongs_to :creator, class_name: 'User'

  # New M:M relationship
  has_many :editors
  has_many :editing_users, through: :editors, source: :user
end