class Cycle < ActiveRecord::Base
  belongs_to :user
  has_many :workouts, :dependent => :destroy,  :autosave => true
end
