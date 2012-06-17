class LiftSet < ActiveRecord::Base
  belongs_to :workout
  belongs_to :exercise

  def weight=(val)
    write_attribute(:weight, round_weight(val))
  end


  def round_weight(val)
    up = round_up(val)
    down = round_down(val)
    if (up - val) < (val - down)
      return up
    else
      return down
    end
  end

  def round_up(val, nearest=5)
    val % nearest == 0 ? val : val + nearest - (val % nearest)
  end
  def round_down(val, nearest=5)
    val % nearest == 0 ? val : val - (val % nearest)
  end



end
