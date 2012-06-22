class LiftSet < ActiveRecord::Base
  belongs_to :workout
  belongs_to :exercise

  default_scope :order => 'position ASC'

  AVAILABLE_PLATES = [45, 35, 25, 10, 5, 2.5]
  EMPTY_BAR_WEIGHT = 45

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

  def plates
    calc_plates_needed
  end

  private

  def calc_plates_needed(bar_weight = EMPTY_BAR_WEIGHT)
    plates_needed = Array.new()
    current = bar_weight
    current_group_of_plates = 0

    while (current < weight)
      if (add_plate?(current_group_of_plates, current))
        current += (AVAILABLE_PLATES[current_group_of_plates] * 2)
        plates_needed << AVAILABLE_PLATES[current_group_of_plates]
      else
        current_group_of_plates += 1
      end
      if (current <= 0 || current < AVAILABLE_PLATES.last)
        break
      end
    end
    plates_needed
  end

  def add_plate?(current_group_of_plates, current)
    (weight - ((AVAILABLE_PLATES[current_group_of_plates] * 2) + current)) >= 0
  end


end
