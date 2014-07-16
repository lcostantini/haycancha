class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name
      t.string :address
      t.string :telephone

      t.timestamps
    end
  end
end
