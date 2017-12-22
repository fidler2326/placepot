class AddTimeToRace < ActiveRecord::Migration
  def change
    add_column :races, :time, :datetime
  end
end
