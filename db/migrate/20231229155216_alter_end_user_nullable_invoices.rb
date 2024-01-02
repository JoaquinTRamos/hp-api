class AlterEndUserNullableInvoices < ActiveRecord::Migration[7.1]
  def change
    change_column :invoices, :enduser_id, :bigint, null: true
  end
end
