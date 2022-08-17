class CreateFeedbackTags < ActiveRecord::Migration[6.1]
  def change
    create_table :feedback_tags do |t|
      t.references :feedback, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
    add_index :feedback_tags, [:feedback_id, :tag_id], unique: true
  end
end
