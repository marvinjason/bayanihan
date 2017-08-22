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

    add_column :users, :oauth_token, :text
    add_column :users, :oauth_secret, :text
    add_column :users, :consumer_key, :text
    add_column :users, :consumer_secret, :text
  end
end
