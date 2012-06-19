class Cycle < ActiveRecord::Base
  belongs_to :mesocycle
  has_many :workouts, :dependent => :destroy,  :autosave => true
end
