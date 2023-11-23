class CreateEntities < ActiveRecord::Migration[7.1]
  def change
    create_table :entities do |t|
      t.integer :tax_id, null: false
      t.string :name, null: false
    end
  end
end
