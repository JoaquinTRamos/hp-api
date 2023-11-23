class CreateDeals < ActiveRecord::Migration[7.1]
  def change
    create_table :deals do |t|
      t.integer :version, null: false
      t.boolean :vigencia, null: false, default: false
    end
  end
end
