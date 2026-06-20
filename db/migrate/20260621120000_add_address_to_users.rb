class AddAddressToUsers < ActiveRecord::Migration[8.1]
  def change
    # null: false is what makes the column NOT NULL, so the database
    # won't accept a user that doesn't have an address
    add_column :users, :address, :string, null: false
  end
end
