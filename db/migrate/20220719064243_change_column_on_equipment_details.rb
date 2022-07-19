class ChangeColumnOnEquipmentDetails < ActiveRecord::Migration[6.1]
  def change
    change_column_null :equipment_details, :content, false
  end
end
