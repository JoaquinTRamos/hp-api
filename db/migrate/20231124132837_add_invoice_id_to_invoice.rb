class AddInvoiceIdToInvoice < ActiveRecord::Migration[7.1]
  def change
    add_column :invoices, :invoice_id, :string
  end
end
