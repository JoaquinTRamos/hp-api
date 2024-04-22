class AddCategoryToProductMaster < ActiveRecord::Migration[7.1]
  def change
    add_column :product_masters, :category, :string, null: false
  end
end
