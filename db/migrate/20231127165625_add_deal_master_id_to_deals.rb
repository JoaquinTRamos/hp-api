class AddDealMasterIdToDeals < ActiveRecord::Migration[7.1]
  def change
    add_column :deals, :deal_master_id, :bigint
  end
end
