class UpdateCycleToMicrocycle < ActiveRecord::Migration
  def up
    add_column :cycles, :mesocycle_id, :integer
    add_column :cycles, :program_id, :integer
    add_column :cycles, :name, :string
    remove_column :cycles, :max_bench
    remove_column :cycles, :max_squat
    remove_column :cycles, :max_deadlift
    remove_column :cycles, :max_ohp
    remove_column :cycles, :user_id
  end

  def down
    remove_column :cycles, :mesocycle_id
    remove_column :cycles, :program_id
    remove_column :cycles, :name
    add_column :cycles, :max_bench, :integer
    add_column :cycles, :max_squat, :integer
    add_column :cycles, :max_deadlift, :integer
    add_column :cycles, :max_ohp, :integer
    add_column :cycles, :user_id, :integer
  end
end
