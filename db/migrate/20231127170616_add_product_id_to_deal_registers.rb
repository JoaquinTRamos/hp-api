class AddProductIdToDealRegisters < ActiveRecord::Migration[7.1]
  def change
    add_column :deal_registers, :product_id, :bigint
  end
end
