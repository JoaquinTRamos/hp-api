class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.references :SKU, null: false
      t.string :option
      t.string :origin, null: false
      t.string :serial_id
      t.decimal :purchase_price, null: false
      t.string :pp_currency_code, null: false
    end
  end
end
