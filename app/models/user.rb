class User < ApplicationRecord
  validates :name, :DOB, :email, :phone_number, presence: true

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end