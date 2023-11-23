class CreateInvoiceRegisters < ActiveRecord::Migration[7.1]
  def change
    create_table :invoice_registers do |t|
      t.references :product, null: false, foreign_key: true
      t.references :deal_register, null: false
      t.integer :quantity
      t.decimal :sell_price
      t.string :sp_currency_code
    end
  end
end
