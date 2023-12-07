class AddColumnDealMasterIdInDeals < ActiveRecord::Migration[7.1]
  def change
    add_column :deals, :master_id, :bigint
  end
end
