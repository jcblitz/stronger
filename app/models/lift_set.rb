class LiftSet
  attr_accessor :lift, :weight, :reps

  def initialize(lift, weight, reps)
    @lift = lift
    @weight = weight.ceil
    @reps = reps
  end

  def rounded_weight
    up = round_up
    down = round_down
    if (up-self.weight) < (self.weight-down)
      return up
    else
      return down
    end
  end

  def round_up(nearest=5)
    self.weight % nearest == 0 ? self.weight : self.weight + nearest - (self.weight % nearest)
  end
  def round_down(nearest=5)
    self.weight % nearest == 0 ? self.weight : self.weight - (self.weight % nearest)
  end
end