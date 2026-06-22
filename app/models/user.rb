class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :created_posts, class_name: "Post", foreign_key: :creator_id, inverse_of: :creator, dependent: :destroy

  validates :name, :dob, :email, :phone_number, :address, presence: true
  validates :email, uniqueness: { case_sensitive: false }
end
