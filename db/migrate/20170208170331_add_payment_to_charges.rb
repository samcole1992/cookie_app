class AddPaymentToCharges < ActiveRecord::Migration[5.0]
  def change
    add_column :charges, :payment, :integer
  end
end
