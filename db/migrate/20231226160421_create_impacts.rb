class CreateImpacts < ActiveRecord::Migration[7.1]
  def change
    create_table :impacts do |t|

      t.timestamps
    end
  end
end
