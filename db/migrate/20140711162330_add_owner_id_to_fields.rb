class AddOwnerIdToFields < ActiveRecord::Migration
  def change
    add_column :fields, :owner_id, :integer
    add_index :fields, :owner_id
  end
end
