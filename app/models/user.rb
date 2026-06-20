class User < ApplicationRecord
	validates :name, :dob, :email, :phone_number, :address, presence: true
	
	validates :email, format: {
		# note: I might have gone a little excessive with the allowed stuff
		# but this is basic regex from the internet so I guess it's fine
    with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, 
    message: "must be a valid email address"
  }

	validates :email, uniqueness: { case_sensitive: false }
end
