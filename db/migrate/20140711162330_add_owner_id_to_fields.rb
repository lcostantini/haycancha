class AddOwnerIdToFields < ActiveRecord::Migration
  def change
    add_column :fields, :owner_id, :integer
  end
end
