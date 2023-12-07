class ChangeColumnNameMasterIdToDealMasterIdDeals < ActiveRecord::Migration[7.1]
  def change
    rename_column :deals, :master_id, :deal_master_id
  end
end
