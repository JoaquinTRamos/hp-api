class AddBrandToProductMaster < ActiveRecord::Migration[7.1]
  def change
    add_column :product_masters, :brand, :string, null: false
  end
end
