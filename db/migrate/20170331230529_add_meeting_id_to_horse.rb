class AddMeetingIdToHorse < ActiveRecord::Migration
  def change
    add_column :horses, :meeting_id, :integer
  end
end
