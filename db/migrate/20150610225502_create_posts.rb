class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.string :contact_email
      t.integer :user_id
      t.datetime :last_update
      t.timestamps null: false
    end
  end
end
