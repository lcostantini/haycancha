class AddCreatedForToEvents < ActiveRecord::Migration
  def change
    add_column :events, :created_for, :datetime
  end
end
