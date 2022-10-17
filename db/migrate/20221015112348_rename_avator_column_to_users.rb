class RenameAvatorColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :avator, :avatar
  end
end
