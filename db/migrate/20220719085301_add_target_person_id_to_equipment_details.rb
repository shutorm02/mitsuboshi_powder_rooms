class AddTargetPersonIdToEquipmentDetails < ActiveRecord::Migration[6.1]
  def change
    add_reference :equipment_details, :target_person, foreign_key: true
  end
end
