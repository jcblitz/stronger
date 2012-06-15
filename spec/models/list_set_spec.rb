require "rspec"
require "spec_helper"

describe "LiftSet" do
  it "tells you how many reps at a given weight for a lift" do
    lift = LiftSet.new(:bench, 200, 5)

    lift.lift.should == :bench
  end
end