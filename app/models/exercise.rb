class Exercise < ActiveRecord::Base
  validates_uniqueness_of :key
  validates_presence_of :key
  validates_presence_of :name
end
