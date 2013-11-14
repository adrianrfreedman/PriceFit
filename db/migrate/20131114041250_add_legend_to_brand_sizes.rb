class AddLegendToBrandSizes < ActiveRecord::Migration
  def change
    add_column :brand_sizes, :legend, :string
  end
end
