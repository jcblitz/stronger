class Workout < ActiveRecord::Base
  has_many :lift_sets, :dependent => :destroy, :autosave => true
  belongs_to :cycle

  default_scope :order => 'position ASC'

end
