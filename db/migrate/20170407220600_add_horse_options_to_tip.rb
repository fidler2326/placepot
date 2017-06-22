class AddHorseOptionsToTip < ActiveRecord::Migration
  def change
    add_column :tips, :horse_options, :boolean, array: true, default: []
  end
end
