require "rspec"
require "spec_helper"

describe "Wendler531Bbb" do
  describe "generate" do
    it "creates a number of workouts" do
      # TODO Is this needed?
      load "#{Rails.root}/db/seeds.rb"

      user = create(:user)

      program = Wendler531Bbb.new(500, 400, 300, 200, user)
      mesocycle = program.generate
      mesocycle.save!

      mesocycle.cycles.count.should eq 4
    end

    it "prints a workout" do
      # TODO Is this needed?
      load "#{Rails.root}/db/seeds.rb"

      user = create(:user)

      program = Wendler531Bbb.new(500, 400, 300, 200, user)
      mesocycle = program.generate
      mesocycle.save!

      mesocycle.cycles.each do |cycle|
        puts "Name: #{cycle.name}\n"



      end
    end
  end
end