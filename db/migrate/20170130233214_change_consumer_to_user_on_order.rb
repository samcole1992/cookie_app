class ChangeConsumerToUserOnOrder < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :consumer_id, :user_id
  end
end
