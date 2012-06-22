class Cycle < ActiveRecord::Base
  belongs_to :mesocycle
  has_many :workouts, :dependent => :destroy, :autosave => true

  default_scope :order => 'position ASC'

  def completed?
    self.workouts.collect { |x| x.completed?}.all?
  end
end
