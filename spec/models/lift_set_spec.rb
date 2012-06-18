require 'spec_helper'

describe LiftSet do
  describe "rounding" do
    it "sets 201 to 200" do
      ls = LiftSet.new(weight: 201)
      ls.weight.should eq (200)
    end
    it "sets 204 to 205" do
      ls = LiftSet.new(weight: 201)
      ls.weight.should eq (200)
    end
    it "sets 204 to 205" do
      ls = LiftSet.new(weight: 204)
      ls.weight.should eq (205)
    end

    it "sets 207 to 205" do
      ls = LiftSet.new(weight: 207)
      ls.weight.should eq (205)
    end
    it "sets 208 to 210" do
      ls = LiftSet.new(weight: 208)
      ls.weight.should eq (210)
    end
  end
  describe "plates" do
    it "returns [] for 45" do
      ls = LiftSet.new(weight: 45)
      ls.plates.should eq([])
    end
    it "returns [45] for 135" do
      ls = LiftSet.new(weight: 135)
      ls.plates.should eq([45])
    end

    it "returns [45, 45, 45] for 315" do
      ls = LiftSet.new(weight: 135)
      ls.plates.should eq([45])
    end

    it "returns [45, 45, 45] for 315" do
      ls = LiftSet.new(weight: 135)
      ls.plates.should eq([45])
    end

    # Uses the least amount of plates
    it "returns [45, 45, 25, 5, 2.5] for 290" do
      ls = LiftSet.new(weight: 290)
      ls.plates.should eq([45, 45, 25, 5, 2.5])
    end
  end
end
