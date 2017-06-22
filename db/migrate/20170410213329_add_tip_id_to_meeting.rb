class AddTipIdToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :tip_id, :integer
  end
end
