class User < ApplicationRecord
  has_many :creators, class_name: "Post"
end
