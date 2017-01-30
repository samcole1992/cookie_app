class AddCookieToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :cookie_amount, :integer, null: false
    add_column :orders, :cookie_type, :string, null: false
  end
end
