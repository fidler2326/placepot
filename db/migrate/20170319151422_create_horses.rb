class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|

      t.timestamps null: false
    end
  end
end
