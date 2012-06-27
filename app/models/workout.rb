class Workout < ActiveRecord::Base
  has_many :lift_sets, :dependent => :destroy, :autosave => true
  belongs_to :cycle

  default_scope :order => 'position ASC'

  def completed?
    self.status.to_sym == Status::COMPLETE unless self.status.nil?
  end

end

class Status
  CURRENT = :current
  INCOMPLETE = :incomplete
  COMPLETE = :complete
  IN_PROGRESS = :in_progress
end