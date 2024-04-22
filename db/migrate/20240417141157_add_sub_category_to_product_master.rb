class AddSubCategoryToProductMaster < ActiveRecord::Migration[7.1]
  def change
    add_column :product_masters, :subcategory, :string, null: false
  end
end
