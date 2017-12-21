class AddProgramNumberToHorse < ActiveRecord::Migration
  def change
    add_column :horses, :program_number, :string
  end
end
