require "rspec"
require "spec_helper"

describe "Wender531BBB" do
  describe "generate"
  it "gives you a total cycle count of 4" do
    program = Wendler531BBB.new
    mesocycle = program.generate(500, 400, 300, 200)
    mesocycle.count.should eq 4
  end

  it "prints a report" do
    program = Wendler531BBB.new
    mesocycle = program.generate(500, 400, 300, 200)
    mesocycle.each do |key, cycle|
      puts key

      cycle.each do |cycle_type, workout|
        puts cycle_type

        workout.each do |lift_set|
          puts "#{lift_set.lift} | #{lift_set.rounded_weight} | #{lift_set.reps}"
        end
      end
    end
  end
end