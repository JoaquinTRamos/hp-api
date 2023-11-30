class ChangeNullableDealRegisterInvoiceRegister < ActiveRecord::Migration[7.1]
  def change
    change_column :invoice_registers, :deal_register_id, :bigint, null: true
  end
end
