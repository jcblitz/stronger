class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :cycle_id
      t.string :title
      t.boolean :completed, :default => false
      t.datetime :completed_date

      t.timestamps
    end
  end
end
