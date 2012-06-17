class Workout < ActiveRecord::Base
  has_many :lift_sets, :dependent => :destroy
  belongs_to :cycle

end
