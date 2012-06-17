require "rspec"
require "spec_helper"

describe "Wender531BBB" do
  #before(:suite) do

  #end

  describe "generate"
  it "gives you a total cycle count of 4" do
    #program = Wendler531BBB.new
    #mesocycle = program.generate(500, 400, 300, 200)
    #mesocycle.count.should eq 4
  end

  it "prints a report" do
    load "#{Rails.root}/db/seeds.rb"

    cycle = Cycle.new(max_deadlift: 500, max_squat: 400, max_bench: 300, max_ohp: 200, user_id: 1)
    program = Wendler531Bbb.new(cycle)
    program.generate

    cycle = Cycle.first
    cycle.workouts.each do |workout|
      workout.lift_sets.each do |ls|
        puts ls.inspect
      end
    end


  end
end