class AddTextsToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :breckfast_text, :text
    add_column :records, :lunch_text, :text
    add_column :records, :dinner_text, :text
  end
end
