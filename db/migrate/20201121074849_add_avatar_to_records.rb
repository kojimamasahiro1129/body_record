class AddAvatarToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :avatar, :string
  end
end
