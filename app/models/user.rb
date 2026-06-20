class User < ApplicationRecord
  validates :name, :dob, :email, :phone_number, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP
end
