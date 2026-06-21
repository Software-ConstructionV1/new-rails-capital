class CreatePostEditings < ActiveRecord::Migration[8.1]
  def change
    create_table :post_editings do |t|
      t.references :post_editor, null: false, foreign_key: { to_table: :users }
      t.references :edited_post, null: false, foreign_key: { to_table: :posts }

      t.timestamps
    end
  end
end
