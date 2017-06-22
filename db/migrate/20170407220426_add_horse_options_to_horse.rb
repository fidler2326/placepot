class AddHorseOptionsToHorse < ActiveRecord::Migration
  def change
    add_column :horses, :horse_options, :boolean, array: true, default: []
  end
end
