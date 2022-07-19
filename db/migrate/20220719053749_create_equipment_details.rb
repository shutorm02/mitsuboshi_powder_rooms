class CreateEquipmentDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment_details do |t|
      t.string :content

      t.timestamps
    end
  end
end
