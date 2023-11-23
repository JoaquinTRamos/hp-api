class CreateDealRegisters < ActiveRecord::Migration[7.1]
  def change
    create_table :deal_registers do |t|
      t.daterange :available_range, null:false
      t.decimal :monto, null: false
      t.integer :max_cantidad, null: false
      t.references :product_sku, null: false
    end
  end
end
