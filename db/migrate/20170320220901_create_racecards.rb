class CreateRacecards < ActiveRecord::Migration
  def change
    create_table :racecards do |t|

      t.timestamps null: false
    end
  end
end
