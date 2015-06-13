class CreatePostrecipients < ActiveRecord::Migration
  def change
    create_table :postrecipients do |t|
      t.belongs_to :post, index: true, foreign_key: true
      t.belongs_to :recipient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
