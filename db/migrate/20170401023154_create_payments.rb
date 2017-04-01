class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.belongs_to :user, null: false
      t.integer :payment
    end
  end
end
