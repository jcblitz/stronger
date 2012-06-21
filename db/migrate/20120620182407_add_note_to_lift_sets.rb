class AddNoteToLiftSets < ActiveRecord::Migration
  def change
    add_column :lift_sets, :note, :string

  end
end
