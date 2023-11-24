class RemoveDealSkuId < ActiveRecord::Migration[7.1]
  def change
    remove_column :deal_registers, :deal_id_id
  end
end
