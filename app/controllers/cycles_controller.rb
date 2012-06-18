#I shouldn't have to do this
require "wendler_531_bbb"
require "wendler_531_body_builder"

class CyclesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource

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

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cycle }
    end
  end

  # GET /cycles/new
  # GET /cycles/new.json
  def new
    @cycle = Cycle.new
    @cycle.user = User.find(params[:user_id])

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
    @cycle.user = current_user

    respond_to do |format|
      if @cycle.save

        program = nil
        case @cycle.program_type
          when "bbb"
            program = Wendler531Bbb.new(@cycle)
          when "531bb"
            program = Wendler531BodyBuilder.new(@cycle)
        end

        @cycle = program.generate
        @cycle.save

        format.html { redirect_to user_cycle_path(current_user, @cycle), notice: 'Cycle was successfully created.' }
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

        @cycle.workouts.delete_all

        program = nil
        case @cycle.program_type
          when "bbb"
            program = Wendler531Bbb.new(@cycle)
          when "531bb"
            program = Wendler531BodyBuilder.new(@cycle)
        end

        program.generate

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
      format.html { redirect_to user_cycles_path(current_user) }
      format.json { head :no_content }
    end
  end
end
