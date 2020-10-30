class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.float :weight
      t.float :bmi
      t.float :fat
      t.string :img
      t.date :date
      t.timestamps
      
    end
  end
end
