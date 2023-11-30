class ChangeRegisterIdToInvoiceRegisterId < ActiveRecord::Migration[7.1]
  def change
    rename_column :invoices, :registers_id, :invoice_registers_id
  end
end
