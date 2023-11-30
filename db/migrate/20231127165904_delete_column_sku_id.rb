class DeleteColumnSkuId < ActiveRecord::Migration[7.1]
  def change
    remove_column :deals, :deal_sku_id
  end
end
