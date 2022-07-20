class RenamePeopleColumnToTargetPeople < ActiveRecord::Migration[6.1]
  def change
    rename_column :target_people, :people, :target
  end
end
