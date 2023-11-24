class RemoveProductSkuDealReg < ActiveRecord::Migration[7.1]
  def change
    remove_column :deal_registers, :product_sku_id
  end
end
