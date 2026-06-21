class CreatePostEditors < ActiveRecord::Migration[8.1]
  def change
    # Many-to-Many: this is our OWN join table connecting posts and users (as editors).
    # We build it by hand (no has_and_belongs_to_many).
    create_table :post_editors do |t|
      t.references :post, null: false, foreign_key: true
      t.references :editor, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    # A user should not be added as an editor of the same post twice.
    add_index :post_editors, [ :post_id, :editor_id ], unique: true
  end
end
