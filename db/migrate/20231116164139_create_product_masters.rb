class CreateProductMasters < ActiveRecord::Migration[7.1]
  def change
    create_table :product_masters do |t|
      t.string :SKU, null: false
      t.string :description
    end
  end
end
