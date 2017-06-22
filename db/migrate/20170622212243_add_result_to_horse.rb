class AddResultToHorse < ActiveRecord::Migration
  def change
    add_column :horses, :result, :string
  end
end
