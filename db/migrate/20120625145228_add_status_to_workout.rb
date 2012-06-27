class AddStatusToWorkout < ActiveRecord::Migration
  def change

    completed = []
    Workout.all do |workout|
      if (workout.completed?)
        completed << workout
      end
    end

    add_column :workouts, :status, :string
    remove_column :workouts, :completed

    completed.each do |workout|
      workout.status = Status::COMPLETE
      workout.save!
    end

  end
end
