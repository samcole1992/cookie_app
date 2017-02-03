class AddDistanceToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :distance, :float

  end
end
