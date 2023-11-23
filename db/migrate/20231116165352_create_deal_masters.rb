class CreateDealMasters < ActiveRecord::Migration[7.1]
  create_enum :canal_types, ["DISTRIBUCION", "Online", "BNA", "CIUDAD"]
  def change
    create_table :deal_masters do |t|
      t.integer :deal_id
      t.enum :canal, array:true, null:false, enum_type: :canal_types
    end
  end
end
