module ExerciseUtil
  @config = YAML::load(File.open("#{Rails.root}/config/exercises.yml"))
  def ExerciseUtil.find(key)
    ex = @config[key]
    return Exercise.new(ex["name"], key)
  end
end