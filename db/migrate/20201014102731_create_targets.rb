class CreateTargets < ActiveRecord::Migration[5.2]
  def change
    create_table :targets do |t|
      t.float :weight
      t.float :bmi
      t.float :fat
      t.string :img

      t.timestamps
    end
  end
end
