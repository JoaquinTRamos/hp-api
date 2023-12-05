class ChangeColumnNamesSku < ActiveRecord::Migration[7.1]
  def change
    rename_column :products, :SKU_id, :sku_id
    rename_column :product_masters, :SKU, :sku
  end
end
