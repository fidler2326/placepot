class AddMeetingToLeague < ActiveRecord::Migration
  def change
    add_column :leagues, :meeting, :integer
  end
end
