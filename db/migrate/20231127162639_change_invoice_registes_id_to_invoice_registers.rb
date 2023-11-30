class ChangeInvoiceRegistesIdToInvoiceRegisters < ActiveRecord::Migration[7.1]
  def change
    rename_column :invoices, :invoice_registers_id, :invoice_registers
  end
end
