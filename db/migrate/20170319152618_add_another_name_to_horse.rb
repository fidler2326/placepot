class AddAnotherNameToHorse < ActiveRecord::Migration
  def change
    add_column :horses, :name, :string
  end
end
