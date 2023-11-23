class AddDealMasterToDeal < ActiveRecord::Migration[7.1]
  def change
    add_reference :deals, :deal_sku, null: false
  end
end
