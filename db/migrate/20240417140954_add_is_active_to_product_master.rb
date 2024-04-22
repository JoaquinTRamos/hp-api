class AddIsActiveToProductMaster < ActiveRecord::Migration[7.1]
  def change
    add_column :product_masters, :is_active, :boolean, null: false
  end
end
