class UpdateImpactsTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :impacts, :updated_at
    rename_column :impacts, :created_at, :impacted_at
  end
end
