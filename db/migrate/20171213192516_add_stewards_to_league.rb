class AddStewardsToLeague < ActiveRecord::Migration
  def change
    add_column :leagues, :steward, :integer
  end
end
