class User < ApplicationRecord
  # none of these can be left blank
  validates :name, presence: true
  validates :dob, presence: true
  validates :phone_number, presence: true

  # email has to be there, actually look like an email, and not already be taken.
  # URI::MailTo::EMAIL_REGEXP is the email pattern Ruby already ships with, so no need to write our own.
  validates :email,
            presence: true,
            format: { with: URI::MailTo::EMAIL_REGEXP },
            uniqueness: true
end
