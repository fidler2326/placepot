class AddHorseIdToTip < ActiveRecord::Migration
  def change
    add_column :tips, :horse_id, :integer
  end
end
