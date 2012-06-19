require "rspec"
require "spec_helper"

describe "Wendler531Bbb" do
  describe "generate" do
    it "creates a number of workouts" do
      # TODO Is this needed?
      load "#{Rails.root}/db/seeds.rb"

      user = create(:user)

      mesocycle = Mesocycle.new(max_deadlift: 500, max_squat: 400, max_bench: 300, max_ohp: 200, user: user)

      program = Wendler531Bbb.new(mesocycle)
      mesocycle = program.generate
      mesocycle.save!

      mesocycle.cycles.count.should eq 4
    end

    it "prints a workout" do
      # TODO Is this needed?
      load "#{Rails.root}/db/seeds.rb"

      user = create(:user)

      mesocycle = Mesocycle.new(max_deadlift: 500, max_squat: 400, max_bench: 300, max_ohp: 200, user: user)

      program = Wendler531Bbb.new(mesocycle)
      mesocycle = program.generate
      mesocycle.save!

    end
  end
end