class RenameBreckfastTextColumnToRecords < ActiveRecord::Migration[5.2]
  def change
     rename_column :records, :breckfast_text, :breakfast_text
  end
end
