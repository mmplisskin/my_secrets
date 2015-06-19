class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :name
      t.string :email
      t.belongs_to :ouser, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
