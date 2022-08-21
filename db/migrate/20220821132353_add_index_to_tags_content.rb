class AddIndexToTagsContent < ActiveRecord::Migration[6.1]
  def change
    add_index :tags, :content, unique: true
  end
end
