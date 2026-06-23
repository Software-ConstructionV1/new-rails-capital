class User < ApplicationRecord
  has_many :created_posts, foreign_key: :user_id, class_name: "Post"  
end
