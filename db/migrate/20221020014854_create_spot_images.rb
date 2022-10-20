class CreateSpotImages < ActiveRecord::Migration[6.1]
  def change
    create_table :spot_images do |t|
      t.string :image, null: false
      t.references :spot, foreign_key: true

      t.timestamps
    end
  end
end
