class RemoveImpactsId < ActiveRecord::Migration[7.1]
  def change
    remove_column :deal_masters, :impacts_id
    remove_column :deals, :impacts_id
    remove_column :deal_registers, :impacts_id
    remove_column :entities, :impacts_id
    remove_column :locations, :impacts_id
    remove_column :products, :impacts_id
    remove_column :product_masters, :impacts_id
    remove_column :invoice_registers, :impacts_id
    remove_column :invoices, :impacts_id
  end
end
