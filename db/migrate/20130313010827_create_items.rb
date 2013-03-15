class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.money :price, currency: { present: false }

      t.timestamps
    end
  end
end
