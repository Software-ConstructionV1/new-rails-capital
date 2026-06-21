class AddCreatorToPosts < ActiveRecord::Migration[8.1]
  def change
    # One-to-Many: a Post belongs to one creator (a User).
    # This adds a "creator_id" column on posts that points to the users table.
    add_reference :posts, :creator, foreign_key: { to_table: :users }
  end
end
