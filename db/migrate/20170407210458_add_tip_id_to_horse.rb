class AddTipIdToHorse < ActiveRecord::Migration
  def change
    add_column :horses, :tip_id, :integer
  end
end
