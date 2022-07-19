class CreateEquipment < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment do |t|
      t.references :spot, null: false, foreign_key: true
      t.references :equipment_detail, null: false, foreign_key: true

      t.timestamps
    end
    add_index :equipment, [:spot_id, :equipment_detail_id], unique: true
  end
end
