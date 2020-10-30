class AddImagesToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :images, :json
  end
end
