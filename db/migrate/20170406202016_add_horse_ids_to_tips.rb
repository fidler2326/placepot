class AddHorseIdsToTips < ActiveRecord::Migration
  def change
    add_column :tips, :horse_ids, :integer, array: true, default: []
  end
end
