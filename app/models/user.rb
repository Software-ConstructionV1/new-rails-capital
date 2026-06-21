class User < ApplicationRecord
  has_many :posts, inverse_of: :creator, foreign_key: "user_id"
end
