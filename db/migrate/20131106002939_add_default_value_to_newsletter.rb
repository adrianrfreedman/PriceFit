class AddDefaultValueToNewsletter < ActiveRecord::Migration
  def change
    change_column :users, :newsletter, :boolean, default: false
  end
end
