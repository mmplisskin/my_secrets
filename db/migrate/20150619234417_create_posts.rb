class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :encrypted_description
      t.integer :ouser_id
      t.timestamps null: false
    end
  end
end
