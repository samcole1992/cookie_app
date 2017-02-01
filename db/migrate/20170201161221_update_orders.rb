class UpdateOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :user_id
    add_column :orders, :consumer_id, :integer, null: false
    add_column :orders, :provider_id, :integer
  end
end
