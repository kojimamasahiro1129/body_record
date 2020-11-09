class AddDetailsToCaloriesBurned < ActiveRecord::Migration[5.2]
  def change
    add_column :calories_burneds, :level, :string
    add_column :calories_burneds, :sense, :string
  end
end

