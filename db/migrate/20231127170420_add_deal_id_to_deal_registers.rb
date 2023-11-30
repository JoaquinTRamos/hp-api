class AddDealIdToDealRegisters < ActiveRecord::Migration[7.1]
  def change
  add_column :deal_registers, :deal_id, :bigint
  end
end
