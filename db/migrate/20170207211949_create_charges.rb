class CreateCharges < ActiveRecord::Migration[5.0]
  def change
    create_table :charges do |t|
      t.belongs_to :order, null: false
      t.string :stripe_customer_token
      t.timestamps
    end
  end
end
