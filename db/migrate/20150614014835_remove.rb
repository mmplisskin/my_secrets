class Remove < ActiveRecord::Migration
  def change
    drop_table :postrecipients
  end
end
