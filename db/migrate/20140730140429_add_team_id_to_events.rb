class AddTeamIdToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :team, index: true
  end
end
