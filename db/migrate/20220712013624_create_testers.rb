class CreateTesters < ActiveRecord::Migration[6.0]
  def change
    create_table :testers do |t|
      t.string :item_name
      t.integer :price
      t.integer :stock_quantity
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
