class RenamePostsIdToPostId < ActiveRecord::Migration[8.1]
  def change
    rename_column :posteditors, :posts_id, :post_id
  end
end
