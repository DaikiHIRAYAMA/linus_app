class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :item_name
      t.integer :price
      t.integer :size
      t.integer :stock_quantity
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
