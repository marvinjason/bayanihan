class CreateMarkers < ActiveRecord::Migration[5.0]
  def change
    create_table :markers do |t|
      t.float :latitude
      t.float :longitude
      t.text :message
      t.integer :radius
      t.string :icon

      t.timestamps
    end
  end
end
