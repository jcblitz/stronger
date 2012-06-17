class CreateLiftSets < ActiveRecord::Migration
  def change
    create_table :lift_sets do |t|
      t.integer :workout_id
      t.integer :exercise_id
      t.string :reps
      t.integer :weight

      t.timestamps
    end
  end
end
