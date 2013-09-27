class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :response
      t.integer :choice_id
      t.integer :participant_id
      t.timestamps
    end
  end
end
