class OwedMoney < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :owed_money, :integer, default: 0
  end
end
