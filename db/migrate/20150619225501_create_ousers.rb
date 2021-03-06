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
      t.string :otp_secret_key
      t.datetime :last_update
      t.float :latitude
      t.float :longitude
      t.boolean :paid, default: false
      t.datetime :last_payment
      t.timestamps null: false
    end
  end
end
