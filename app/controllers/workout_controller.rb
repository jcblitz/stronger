class WorkoutController < ApplicationController
  def show
    @workout = Workout.find(params[:id])
    @mesocycle = @workout.cycle.mesocycle
  end
end
