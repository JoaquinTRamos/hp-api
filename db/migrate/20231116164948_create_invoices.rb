class CreateInvoices < ActiveRecord::Migration[7.1]
  def change
    create_table :invoices do |t|
      t.references :seller, null: false
      t.references :customer, null: false
      t.references :enduser, null: false
      t.string :agent_flag
      t.string :partner_comment, null: false
      t.date :date, null: false
      t.string :sales_type, null: false
      t.string :record_type, null: false
      t.references :registers, array:true, null: false
    end
  end
end
