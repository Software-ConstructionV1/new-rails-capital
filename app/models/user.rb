class User < ApplicationRecord
    has_many :created_posts, class_name: 'Post', foreign_key: 'creator_id', dependent: :destroy
    has_many :post_editors, foreign_key: 'editor_id', dependent: :destroy
    has_many :edited_posts, through: :post_editors, source: :post
end
