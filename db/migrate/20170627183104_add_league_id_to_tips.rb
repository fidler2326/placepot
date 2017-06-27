class AddLeagueIdToTips < ActiveRecord::Migration
  def change
    add_column :tips, :league_id, :integer
  end
end
