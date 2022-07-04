class AddNames < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :companies, :name, :string
  end
end
