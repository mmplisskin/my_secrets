class CreateOusers < ActiveRecord::Migration
  def change
    create_table :ousers do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :email
      t.string :location
      t.string :image_url
      t.string :url

      t.timestamps null: false
    end
  end
end
