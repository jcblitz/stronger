require "yaml"
require "exercise_util"

class Wendler531BBB

  @config = YAML::load(File.open("#{Rails.root}/config/exercises.yml"))

  CYCLE_FACTOR = [[["5",0.65],["5",0.75],["5+",0.85]],[["3",0.70],["3",0.80],["3+",0.90]],[["5",0.75],["3",0.85],["1+",0.95]],[["5",0.40],["5",0.50],["5",0.60]]]

  OHP_LIFT = ExerciseUtil.find("ohp")
  BENCH_LIFT = ExerciseUtil.find("bench")
  SQUAT_LIFT = ExerciseUtil.find("squat")
  DEADLIFT_LIFT = ExerciseUtil.find("deadlift")
  CHINUP_LIFT = ExerciseUtil.find("chinpup")
  HANGING_LEG_LIFT = ExerciseUtil.find("hangingraise")
  DUMBBELL_ROW_LIFT = ExerciseUtil.find("dumbbellrow")
  LEG_CURL_LIFT = ExerciseUtil.find("legcurl")

  MAX_TRAINING_FACTOR = 0.90

  def description
    "5/3/1: The Simplest and Most Effective Training System for Raw Strength"
  end

  def origin_link
    "http://www.amazon.com/Simplest-Effective-Training-Strength-Edition/dp/B00686OYGQ"
  end

  def generate(deadlift, squat, bench, ohp)
    mesocycle = Hash.new 

    mesocycle[:one] = build_one(deadlift, squat, bench, ohp, 0)
    mesocycle[:two] = build_one(deadlift, squat, bench, ohp, 1)
    mesocycle[:three] = build_one(deadlift, squat, bench, ohp, 2)
    mesocycle[:four] = build_one(deadlift, squat, bench, ohp, 3)

    return mesocycle
  end


  def build_one(deadlift, squat, bench, ohp, week)
    cycle = Hash.new

    ohp_workout = []
    (0..2).each do |count|
      ohp_workout << LiftSet.new(OHP_LIFT, (ohp * MAX_TRAINING_FACTOR) * CYCLE_FACTOR[week][count][1], CYCLE_FACTOR[week][count][0])
    end
    5.times do
      ohp_workout << LiftSet.new(CHINUP_LIFT, 0, "10")
    end
    cycle[:ohp] = ohp_workout

    squat_workout = []
    (0..2).each do |count|
      squat_workout << LiftSet.new(SQUAT_LIFT, (squat * MAX_TRAINING_FACTOR) * CYCLE_FACTOR[week][count][1], CYCLE_FACTOR[week][count][0])
    end
    5.times do
      squat_workout << LiftSet.new(LEG_CURL_LIFT, 0, "10")
    end
    cycle[:squat] = squat_workout

    bench_workout = []
    (0..2).each do |count|
      bench_workout << LiftSet.new(BENCH_LIFT, (bench * MAX_TRAINING_FACTOR) * CYCLE_FACTOR[week][count][1], CYCLE_FACTOR[week][count][0])
    end
    5.times do
      bench_workout << LiftSet.new(DUMBBELL_ROW_LIFT, 0, "10")
    end
    cycle[:bench] = bench_workout

    deadlift_workout = []
    (0..2).each do |count|
      deadlift_workout << LiftSet.new(DEADLIFT_LIFT, (deadlift * MAX_TRAINING_FACTOR) * CYCLE_FACTOR[week][count][1], CYCLE_FACTOR[week][count][0])
    end
    5.times do
      deadlift_workout << LiftSet.new(LEG_CURL_LIFT, 0, "10")
    end
    cycle[:deadlift] = deadlift_workout

    return cycle
  end
end