class AddJoinCodeToLeague < ActiveRecord::Migration
  def change
    add_column :leagues, :join_code, :integer
  end
end
