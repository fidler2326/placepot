class AddTipToTip < ActiveRecord::Migration
  def change
    add_column :tips, :tip, :integer
  end
end
