class AddToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :address, :string, null: false
    add_column :orders, :city, :string, null: false
    add_column :orders, :state, :string, null: false
    add_column :orders, :zip, :string, null: false
    add_column :orders, :allergies, :string
  end
end
