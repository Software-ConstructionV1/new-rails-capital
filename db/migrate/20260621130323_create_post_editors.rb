class CreatePostEditors < ActiveRecord::Migration[8.1]
  def change
    # Manual join table for the Post M:M editor association (editors are Users).
    create_table :post_editors do |t|
      t.references :post, null: false, foreign_key: true
      t.references :editor, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :post_editors, [:post_id, :editor_id], unique: true
  end
end
