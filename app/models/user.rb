class User < ApplicationRecord
  validates_presence_of :name, :dob, :email, :phone_number, :address
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
end