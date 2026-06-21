class User < ApplicationRecord
  validates :name, presence: true
  validates :dob, presence: true
  validates :email, presence: true,
                     uniqueness: { case_sensitive: false },
                     format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  validates :phone_number, presence: true
end