class CreateCycles < ActiveRecord::Migration
  def change
    create_table :cycles do |t|
      t.integer :max_bench
      t.integer :max_squat
      t.integer :max_deadlift
      t.integer :max_ohp
      t.integer :user_id

      t.timestamps
    end
  end
end
