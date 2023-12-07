class DeleteColumnDealMasterIdInDeals < ActiveRecord::Migration[7.1]
  def change
    remove_column :deals, :deal_master_id
  end
end
