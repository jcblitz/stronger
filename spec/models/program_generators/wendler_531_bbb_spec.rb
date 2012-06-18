require "rspec"
require "spec_helper"

describe "Wendler531Bbb" do
  describe "generate" do
    it "creates a number of workouts" do
      # TODO Is this needed?
      load "#{Rails.root}/db/seeds.rb"

      user = create(:user)

      cycle = Cycle.new(max_deadlift: 500, max_squat: 400, max_bench: 300, max_ohp: 200, user: user)
      program = Wendler531Bbb.new(cycle)
      cycle = program.generate

      cycle.workouts.count.should eq 16
    end
  end
end