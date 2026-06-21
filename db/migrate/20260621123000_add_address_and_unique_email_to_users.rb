class AddAddressAndUniqueEmailToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :address, :string, null: false
    add_index :users, :email, unique: true
  end
end
