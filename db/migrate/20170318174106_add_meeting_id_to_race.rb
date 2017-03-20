class AddMeetingIdToRace < ActiveRecord::Migration
  def change
    add_column :races, :meeting_id, :integer
  end
end
