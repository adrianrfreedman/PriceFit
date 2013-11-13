class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.string :website
      t.string :country

      t.timestamps
    end
  end
end
