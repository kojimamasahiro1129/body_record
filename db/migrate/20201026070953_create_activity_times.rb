class CreateActivityTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_times do |t|
      t.integer :time

      t.timestamps
    end
  end
end
