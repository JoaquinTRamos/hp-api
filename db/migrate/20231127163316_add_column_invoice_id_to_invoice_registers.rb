class AddColumnInvoiceIdToInvoiceRegisters < ActiveRecord::Migration[7.1]
  def change
    add_column :invoice_registers, :invoice_id, :bigint
  end
end
