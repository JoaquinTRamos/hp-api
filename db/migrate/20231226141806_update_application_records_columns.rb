class UpdateApplicationRecordsColumns < ActiveRecord::Migration[7.1]
  def change
    rename_column :application_records, :created_at, :impacted_at
    remove_column :application_records, :updated_at
    add_column :deal_masters, :application_records_id, :bigint, null: false
    add_column :deals, :application_records_id, :bigint, null: false
    add_column :deal_registers, :application_records_id, :bigint, null: false
    add_column :entities, :application_records_id, :bigint, null: false
    add_column :locations, :application_records_id, :bigint, null: false
    add_column :products, :application_records_id, :bigint, null: false
    add_column :product_masters, :application_records_id, :bigint, null: false
    add_column :invoice_registers, :application_records_id, :bigint, null: false
    add_column :invoices, :application_records_id, :bigint, null: false
  end
end
