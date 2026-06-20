class AddConstraintsToUsers < ActiveRecord::Migration[8.1]
  def change
    change_column_null :users, :name, false
    change_column_null :users, :dob, false
    change_column_null :users, :email, false
    change_column_null :users, :phone_number, false
    
    add_index :users, :email, unique: true
  end
end
