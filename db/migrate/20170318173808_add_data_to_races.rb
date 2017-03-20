class AddDataToRaces < ActiveRecord::Migration
  def change
    add_column :races, :time, :time
  end
end
