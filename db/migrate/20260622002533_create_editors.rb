class CreateEditors < ActiveRecord::Migration[8.1]
  def change
    create_table :editors do |t|
      t.string :name
      t.integer :age
      t.string :email

      t.timestamps
    end
  end
end
