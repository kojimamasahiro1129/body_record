class AddCulamsToResults < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :cal_burn_sum, :integer
    add_column :results, :cal_intake_sum, :integer
    add_column :results, :burn_intake_diff, :integer
  end
end
