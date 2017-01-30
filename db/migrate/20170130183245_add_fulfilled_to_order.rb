class AddFulfilledToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :fulfilled, :boolean, default: false
  end
end
