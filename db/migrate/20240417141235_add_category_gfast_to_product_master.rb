class AddCategoryGfastToProductMaster < ActiveRecord::Migration[7.1]
  def change
    add_column :product_masters, :category_gfast, :string, null: false
  end
end
