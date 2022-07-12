class CreateTestOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :test_orders do |t|
      t.references :user, foreign_key: true
      t.references :tester, foreign_key: true
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
