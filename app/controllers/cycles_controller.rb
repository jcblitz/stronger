#I shouldn't have to do this
require_relative "../../app/models/program_generators/wendler_531_bbb"

class CyclesController < ApplicationController
  # GET /cycles
  # GET /cycles.json
  def index
    @cycles = Cycle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cycles }
    end
  end

  # GET /cycles/1
  # GET /cycles/1.json
  def show
    @cycle = Cycle.find(params[:id])
    program = Wendler531BBB.new
    @mesocycle = program.generate(@cycle.max_deadlift, @cycle.max_squat, @cycle.max_bench, @cycle.max_ohp)


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cycle }
    end
  end

  # GET /cycles/new
  # GET /cycles/new.json
  def new
    @cycle = Cycle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cycle }
    end
  end

  # GET /cycles/1/edit
  def edit
    @cycle = Cycle.find(params[:id])
  end

  # POST /cycles
  # POST /cycles.json
  def create
    @cycle = Cycle.new(params[:cycle])

    respond_to do |format|
      if @cycle.save
        format.html { redirect_to @cycle, notice: 'Cycle was successfully created.' }
        format.json { render json: @cycle, status: :created, location: @cycle }
      else
        format.html { render action: "new" }
        format.json { render json: @cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cycles/1
  # PUT /cycles/1.json
  def update
    @cycle = Cycle.find(params[:id])

    respond_to do |format|
      if @cycle.update_attributes(params[:cycle])
        format.html { redirect_to user_cycle_path(current_user, @cycle), notice: 'Cycle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cycles/1
  # DELETE /cycles/1.json
  def destroy
    @cycle = Cycle.find(params[:id])
    @cycle.destroy

    respond_to do |format|
      format.html { redirect_to cycles_url }
      format.json { head :no_content }
    end
  end
end
