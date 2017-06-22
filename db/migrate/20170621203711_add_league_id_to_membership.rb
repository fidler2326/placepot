class AddLeagueIdToMembership < ActiveRecord::Migration
  def change
    add_column :memberships, :league_id, :integer
  end
end
