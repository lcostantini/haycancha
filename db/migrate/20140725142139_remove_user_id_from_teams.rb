class RemoveUserIdFromTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :user_id, :integer
  end
end
