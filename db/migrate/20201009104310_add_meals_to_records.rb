class AddMealsToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :breackfast, :string
    add_column :records, :dinner, :string
    add_column :records, :lunch, :string
  end
end
