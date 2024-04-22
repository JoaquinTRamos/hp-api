class AddBusinessUnitToProductMaster < ActiveRecord::Migration[7.1]
  def change
    add_column :product_masters, :business_unit, :string, null: false
  end
end
