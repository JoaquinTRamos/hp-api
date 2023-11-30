class ChangeNullableInvoiceRegisters < ActiveRecord::Migration[7.1]
  def change
    change_column :invoices, :registers_id, :bigint, array:true, null: true
  end
end
