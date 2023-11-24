class ChangeInvoiceIdToNotnullableInvoice < ActiveRecord::Migration[7.1]
  def change
    change_column :invoices, :invoice_id, :string, null: false
  end
end
