class AddAddressToUsers < ActiveRecord::Migration[8.1]
  def change
    # NOT NULL constraint; default "" backfills existing rows and inserts where
    # address isn't supplied (the provided _form has no address field).
    add_column :users, :address, :string, null: false, default: ""
  end
end
