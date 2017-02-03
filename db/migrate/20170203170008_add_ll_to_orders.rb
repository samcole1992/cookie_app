class AddLlToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :ll, :string, default: ""
  end
end
