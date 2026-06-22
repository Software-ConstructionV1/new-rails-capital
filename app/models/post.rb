class Post < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :posteditors
  has_many :editors, through: :posteditors
end
