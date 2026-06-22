class CreatePosteditors < ActiveRecord::Migration[8.1]
  def change
    create_table :posteditors do |t|
      t.references :editor, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
