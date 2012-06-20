class Cycle < ActiveRecord::Base
  belongs_to :mesocycle
  has_many :workouts, :dependent => :destroy, :autosave => true

  def completed?
    self.workouts.collect { |x| x.completed?}.all?
  end
end
