class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.string :address1, null: false
      t.string :address2
      t.string :city, null: false
      t.string :prov_code, null: false
      t.string :postal_code, null: false
      t.string :country_code, null: false
    end
  end
end
