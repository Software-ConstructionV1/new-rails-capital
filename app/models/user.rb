class User < ApplicationRecord
  has_many :creators, class_name: "Post"
  has_many :post_editings, class_name: "PostEditing"
  has_many :edited_posts, through: :post_editings, source: :edited_post
end
