class UpdateAppRecordColumns < ActiveRecord::Migration[7.1]
  def change
    rename_column :deal_masters, :application_records_id, :impacts_id
    rename_column :deals, :application_records_id, :impacts_id
    rename_column :deal_registers, :application_records_id, :impacts_id
    rename_column :entities, :application_records_id, :impacts_id
    rename_column :locations, :application_records_id, :impacts_id
    rename_column :products, :application_records_id, :impacts_id
    rename_column :product_masters, :application_records_id, :impacts_id
    rename_column :invoice_registers, :application_records_id, :impacts_id
    rename_column :invoices, :application_records_id, :impacts_id
  end
end
