class PostEditing < ApplicationRecord
  belongs_to :post_editor, class_name: "User"
  belongs_to :edited_post, class_name: "Post"
end
