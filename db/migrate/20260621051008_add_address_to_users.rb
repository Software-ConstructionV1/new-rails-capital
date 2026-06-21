class AddAddressToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :address, :string
    
    User.reset_column_information
    User.update_all(address: "Unknown") if User.any?

    change_column_null :users, :address, false
  end
end