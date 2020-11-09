class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.string :name
      t.string :level
      t.float :mets
      t.string :sense
      t.date :date
      t.integer :minutes
      t.float :weight
      t.timestamps
    end
  end
end
