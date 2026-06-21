class Post < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :post_editings, class_name: "PostEditing"
  has_many :editors, through: :post_editings, source: :post_editor
end
