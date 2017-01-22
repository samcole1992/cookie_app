class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :provider, null: false
      t.belongs_to :consumer, null: false
      t.integer :rating   
      t.string  :body
    end
  end
end
