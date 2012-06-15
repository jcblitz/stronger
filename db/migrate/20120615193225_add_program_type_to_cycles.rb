class AddProgramTypeToCycles < ActiveRecord::Migration
  def change
    add_column :cycles, :program_type, :string

  end
end
