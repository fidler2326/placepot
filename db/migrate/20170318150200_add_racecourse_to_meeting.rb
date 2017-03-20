class AddRacecourseToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :racecourse, :string
  end
end
