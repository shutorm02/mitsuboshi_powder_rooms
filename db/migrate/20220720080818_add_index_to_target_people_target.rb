class AddIndexToTargetPeopleTarget < ActiveRecord::Migration[6.1]
  def change
    add_index :target_people, :target, unique: true
  end
end
