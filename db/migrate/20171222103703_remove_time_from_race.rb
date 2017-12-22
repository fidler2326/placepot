class RemoveTimeFromRace < ActiveRecord::Migration
  def change
    remove_column :races, :time
  end
end
