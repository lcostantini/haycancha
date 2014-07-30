class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :state
      t.references :event, index: true
      t.references :user, index: true
    end
  end
end
