class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :content, null: false
      t.references :target_person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
