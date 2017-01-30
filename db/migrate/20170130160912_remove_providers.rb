class RemoveProviders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :provider_id, :integer, null: false  
  end
end
