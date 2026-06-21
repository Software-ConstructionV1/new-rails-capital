class Editor < ApplicationRecord
	has_many :posts, through: :post_editors
end
