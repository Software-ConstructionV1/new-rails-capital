class User < ApplicationRecord
  validates :name, presence: true
  validates :dob, presence: true
  validates :email, presence: true, 
                    uniqueness: true, 
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "must be a valid email" }
  validates :phone_number, presence: true,uniqueness: true
  validates :address ,presence: true

end