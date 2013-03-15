class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :merchant_id, null: false
      t.integer :item_id, null: false
      t.integer :purchaser_id, null: false
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
