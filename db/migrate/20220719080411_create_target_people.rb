class CreateTargetPeople < ActiveRecord::Migration[6.1]
  def change
    create_table :target_people do |t|
      t.string :people, null: false

      t.timestamps
    end
  end
end
