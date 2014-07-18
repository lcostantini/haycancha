class CreateTeamsUsers < ActiveRecord::Migration
  def change
    create_table :teams_users, id: false do |t|
      t.integer :team_id, null: false
      t.integer :user_id, null: false
    end
  end
end
