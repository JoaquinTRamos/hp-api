class AddMissingEnumColumns < ActiveRecord::Migration[7.1]
  def change
    add_column :deal_masters, :canal_types, :string
  end
end
