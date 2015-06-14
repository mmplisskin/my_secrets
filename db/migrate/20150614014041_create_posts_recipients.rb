class CreatePostsRecipients < ActiveRecord::Migration
  def change
    create_table :posts_recipients, id: false do |t|
      t.belongs_to :post, index: true
      t.belongs_to :recipient, index: true
    end
  end
end
