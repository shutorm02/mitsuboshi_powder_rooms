class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :spot, foreign_key: true

      t.timestamps
    end

    add_index :likes, [:user_id, :spot_id], unique: true
  end
end
