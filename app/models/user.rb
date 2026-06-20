class User < ApplicationRecord
  validates :name, :dob, :email, :phone_number, :address, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
