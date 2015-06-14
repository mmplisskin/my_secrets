class CreatePostsRecipients < ActiveRecord::Migration
  def change
    create_table :posts_recipients do |t|
      t.integer :post_id
      t.integer :recipient_id
      t.timestamps null: false
    end
  end
end
