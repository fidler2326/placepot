class AddDataToHorse < ActiveRecord::Migration
  def change
    add_column :horses, :form, :string
    add_column :horses, :trainer, :string
    add_column :horses, :jockey, :string
  end
end
