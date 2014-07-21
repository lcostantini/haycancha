class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :topic
      t.integer :user_id

      t.timestamps
    end
  end
end
