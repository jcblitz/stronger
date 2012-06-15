class Exercise
  attr_accessor :name, :key, :description

  def initialize(name, key, description = "")
    @name = name
    @key = key
    @description = description
  end

end