class AddPickupToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :pickup, :boolean, default: false
  end
end
