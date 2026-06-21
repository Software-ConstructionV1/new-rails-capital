class PostEditor < ApplicationRecord
  # This is the join model for the Post <-> User (editor) Many-to-Many relationship.
  belongs_to :post
  belongs_to :editor, class_name: "User"
end
