class AddCompanyId < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :company, foreign_key: true
    add_reference :testers, :company, foreign_key: true
  end
end
