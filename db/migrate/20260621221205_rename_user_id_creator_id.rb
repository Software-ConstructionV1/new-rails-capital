class RenameUserIdCreatorId < ActiveRecord::Migration[8.1]
  def change
    rename_column :posts, :creator_id, :creator_id
  end
end
