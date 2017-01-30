class RenameConsumersTable < ActiveRecord::Migration[5.0]
  def self.up
    rename_table :consumers, :users
  end

  def self.down
    rename_table :users, :consumers
  end
end
