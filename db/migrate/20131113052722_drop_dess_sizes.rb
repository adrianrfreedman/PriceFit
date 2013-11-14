class DropDessSizes < ActiveRecord::Migration
  def change
    drop_table :dress_sizes
  end
end
