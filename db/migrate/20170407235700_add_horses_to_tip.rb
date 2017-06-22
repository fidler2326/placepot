class AddHorsesToTip < ActiveRecord::Migration
  def change
    add_column :tips, :horses, :text
  end
end
