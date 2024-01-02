class ChangeColumnsApplicationRecord < ActiveRecord::Migration[7.1]
  def change
    add_column :application_records, :created_at, :timestamp
    rename_column :application_records, :impacted_at, :updated_at
  end
end
