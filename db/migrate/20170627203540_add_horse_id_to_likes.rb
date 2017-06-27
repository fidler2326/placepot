class AddHorseIdToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :horse_id, :integer
  end
end
