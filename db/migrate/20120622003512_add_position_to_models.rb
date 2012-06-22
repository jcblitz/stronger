class AddPositionToModels < ActiveRecord::Migration
  def change
    add_column :cycles, :position, :integer
    add_column :workouts, :position, :integer
    add_column :lift_sets, :position, :integer

    Mesocycle.all.each do |meso|
      meso.cycles.each_with_index do |cycle, index|
        cycle.update_attributes!(:position => index)
        cycle.workouts.each_with_index do |workout, workout_index|
          workout.update_attributes(:position => workout_index)
          workout.lift_sets.each_with_index do |lift_set, lift_set_index|
            lift_set.update_attributes(:position => lift_set_index)
          end
        end
      end
    end
  end
end
