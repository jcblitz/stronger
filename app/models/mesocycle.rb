class Mesocycle < ActiveRecord::Base
  belongs_to :user
  belongs_to :program
  has_many :cycles

end
