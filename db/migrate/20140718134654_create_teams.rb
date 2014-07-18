class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
    add_index :teams, :user_id
  end
end
