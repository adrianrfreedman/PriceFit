class CreateDressSizes < ActiveRecord::Migration
  def change
    create_table :dress_sizes do |t|
      t.string :brand
      t.integer :size
      t.float :bust
      t.float :waist
      t.float :hip

      t.timestamps
    end
  end
end
