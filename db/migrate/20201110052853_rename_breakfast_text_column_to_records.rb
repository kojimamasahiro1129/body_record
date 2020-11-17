class RenameBreakfastTextColumnToRecords < ActiveRecord::Migration[5.2]
  def change
    rename_column :records, :breakfast_text, :food_ids
  end
end
