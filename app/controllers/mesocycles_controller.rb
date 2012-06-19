require "wendler_531_bbb"
require "wendler_531_body_builder"

class MesocyclesController < ApplicationController
  # GET /mesocycles
  # GET /mesocycles.json
  def index
    @mesocycles = Mesocycle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mesocycles }
    end
  end

  # GET /mesocycles/1
  # GET /mesocycles/1.json
  def show
    @mesocycle = Mesocycle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mesocycle }
    end
  end

  # GET /mesocycles/new
  # GET /mesocycles/new.json
  def new
    @mesocycle = Mesocycle.new
    @mesocycle.user = User.find(params[:user_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mesocycle }
    end
  end

  # GET /mesocycles/1/edit
  def edit
    @mesocycle = Mesocycle.find(params[:id])
  end

  # POST /mesocycles
  # POST /mesocycles.json
  def create
    @mesocycle = Mesocycle.new(params[:mesocycle])
    @mesocycle.user = User.find(params[:user_id])

    case @mesocycle.program.key
      when "531bbb"
        program = Wendler531Bbb.new(@mesocycle)
      when "531bb"
        program = Wendler531BodyBuilder.new(@mesocycle)
    end

    @mesocycle = program.generate

    respond_to do |format|
      if @mesocycle.save

        format.html { redirect_to user_mesocycle_path(@mesocycle.user, @mesocycle), notice: 'Mesocycle was successfully created.' }
        format.json { render json: @mesocycle, status: :created, location: @mesocycle }
      else
        format.html { render action: "new" }
        format.json { render json: @mesocycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mesocycles/1
  # PUT /mesocycles/1.json
  def update
    @mesocycle = Mesocycle.find(params[:id])

    respond_to do |format|
      if @mesocycle.update_attributes(params[:mesocycle])
        format.html { redirect_to @mesocycle, notice: 'Mesocycle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mesocycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mesocycles/1
  # DELETE /mesocycles/1.json
  def destroy
    @mesocycle = Mesocycle.find(params[:id])
    user = @mesocycle.user
    @mesocycle.destroy

    respond_to do |format|
      format.html { redirect_to user_mesocycles_path(user) }
      format.json { head :no_content }
    end
  end
end
