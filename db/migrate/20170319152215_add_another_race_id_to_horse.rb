class AddAnotherRaceIdToHorse < ActiveRecord::Migration
  def change
    add_column :horses, :race_id, :integer
  end
end
