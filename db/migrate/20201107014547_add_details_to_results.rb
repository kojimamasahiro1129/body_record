class AddDetailsToResults < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :calories_burneds_id, :integer
  end
end
