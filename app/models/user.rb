class User < ApplicationRecord
  VALID_EMAIL_FORMAT = URI::MailTo::EMAIL_REGEXP

  validates :name, :dob, :email, :phone_number, :address, presence: true
  validates :email, format: { with: VALID_EMAIL_FORMAT }, uniqueness: { case_sensitive: false }
end
