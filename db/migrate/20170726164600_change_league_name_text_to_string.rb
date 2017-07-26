class ChangeLeagueNameTextToString < ActiveRecord::Migration
  def change
    change_column :leagues, :name, :string
  end
end
