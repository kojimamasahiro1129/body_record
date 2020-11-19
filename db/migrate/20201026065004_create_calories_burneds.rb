class CreateCaloriesBurneds < ActiveRecord::Migration[5.2]
  def change
    create_table :calories_burneds do |t|
      t.string :name
      t.float :mets
      t.timestamps
    end
  end
end


