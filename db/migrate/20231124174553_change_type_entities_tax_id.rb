class ChangeTypeEntitiesTaxId < ActiveRecord::Migration[7.1]
  def change
    change_column :entities, :tax_id, :bigint
  end
end
