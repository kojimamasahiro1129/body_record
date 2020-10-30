class CreateRecordFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods_records do |t|
      t.integer :food_id
      t.integer :record_id

      t.timestamps
    end
  end
end
