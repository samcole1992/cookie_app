class RemoveColumnsFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :address
    remove_column :orders, :city
    remove_column :orders, :state
    remove_column :orders, :zip
  end
end
