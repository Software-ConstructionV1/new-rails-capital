class User < ApplicationRecord
  # 1:M
  has_many :posts, foreign_key: 'creator_id'

  # M:M
  has_many :editors
  has_many :edited_posts, through: :editors, source: :post
end