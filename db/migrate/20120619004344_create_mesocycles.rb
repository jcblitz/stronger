class CreateMesocycles < ActiveRecord::Migration
  def change
    create_table :mesocycles do |t|

      t.integer :user_id
      t.integer :program_id
      t.integer :max_bench
      t.integer :max_squat
      t.integer :max_deadlift
      t.integer :max_ohp

      t.timestamps
    end
  end
end
