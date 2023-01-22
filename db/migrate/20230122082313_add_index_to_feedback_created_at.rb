class AddIndexToFeedbackCreatedAt < ActiveRecord::Migration[6.1]
  def change
    add_index :feedbacks, :created_at
  end
end
