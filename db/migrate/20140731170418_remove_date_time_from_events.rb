class RemoveDateTimeFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :date, :date
    remove_column :events, :time, :time
  end
end
