class ChangeColumnNameSkuIdToProductMasterIdProducts < ActiveRecord::Migration[7.1]
  def change
    rename_column :products, :sku_id, :product_master_id
  end
end
