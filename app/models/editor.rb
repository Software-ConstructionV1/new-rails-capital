class Editor < ApplicationRecord
  has_many :posteditors
  has_many :posts, through: :posteditors
end
