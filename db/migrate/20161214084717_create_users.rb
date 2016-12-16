class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid, null: false
      t.string :name
      t.string :location
      t.string :image_url
      t.string :url

      t.timestamps
    end

    add_column :users, :access_token, :text
  end
end
