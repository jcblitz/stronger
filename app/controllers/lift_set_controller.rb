class LiftSetController < ApplicationController
  def update
    @lift_set = LiftSet.find(params[:id])
    respond_to do |format|
      if @lift_set.update_attributes(params[:lift_set])
        format.html { redirect_to user_mesocycle_path(@lift_set.workout.cycle.mesocycle.user, @lift_set.workout.cycle.mesocycle), notice: 'LiftSet has been updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lift_set.errors, status: :unprocessable_entity }
      end
    end
  end
end
