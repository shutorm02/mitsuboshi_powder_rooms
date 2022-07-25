class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def up
    change_column_null :spots, :latitude, true
    change_column_null :spots, :longitude, true
  end

  def down
    change_column_null :spots, :latitude, false 
    change_column_null :spots, :longitude, false 
  end
end
