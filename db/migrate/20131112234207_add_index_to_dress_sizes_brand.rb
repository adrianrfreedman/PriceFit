class AddIndexToDressSizesBrand < ActiveRecord::Migration
  def change
    add_index :dress_sizes, :brand, unique: true
  end
end
