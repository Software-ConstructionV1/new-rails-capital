class AddCreatorToPosts < ActiveRecord::Migration[8.1]
  def change
    # creator_id is a FK to users (1:M: a User creates many Posts)
    add_reference :posts, :creator, foreign_key: { to_table: :users }
  end
end
