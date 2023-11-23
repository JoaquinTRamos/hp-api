class AddDealToDealRegisters < ActiveRecord::Migration[7.1]
  def change
    add_reference :deal_registers, :deal_id, null: false
  end
end
