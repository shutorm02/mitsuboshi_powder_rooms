class AddIndexToSpotCreatedAt < ActiveRecord::Migration[6.1]
  def change
    add_index :spots, :created_at
  end
end
