class Mesocycle < ActiveRecord::Base
  has_many :cycles, :dependent => :destroy, :autosave => true
  belongs_to :user
  belongs_to :program
end
