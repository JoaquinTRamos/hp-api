class DeleteColumnInvoiceRegisters < ActiveRecord::Migration[7.1]
  def change
    remove_column :invoices, :invoice_registers
  end
end
