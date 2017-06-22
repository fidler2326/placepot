class AddSelectionToRacecard < ActiveRecord::Migration
  def change
    add_column :racecards, :selection, :boolean
  end
end
