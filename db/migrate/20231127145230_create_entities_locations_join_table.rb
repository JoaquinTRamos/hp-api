class CreateEntitiesLocationsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :locations, :entities do |t|
      t.index :location_id
      t.index :entity_id
    end
  end
end
