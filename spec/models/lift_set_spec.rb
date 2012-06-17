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

end
