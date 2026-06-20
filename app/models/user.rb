class User < ApplicationRecord
  validates :name, presence: true
  validates :dob, presence: true
  validates :email, presence: true,  uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  validates :phone_number, presence: true
end
