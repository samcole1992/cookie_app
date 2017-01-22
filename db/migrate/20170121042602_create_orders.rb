class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.belongs_to :provider, null: false
      t.belongs_to :consumer, null: false
      t.integer    :payment,  null: false
      t.boolean    :completion,           default: false
      t.timestamps
    end
  end
end
