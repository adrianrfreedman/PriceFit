class CreateBrandSizes < ActiveRecord::Migration
  def change
    create_table :brand_sizes do |t|
      t.integer :size
      t.float :bust
      t.float :waist
      t.float :hip
      t.integer :brand_id

      t.timestamps
    end
    add_index :brand_sizes, :brand_id
  end
end
