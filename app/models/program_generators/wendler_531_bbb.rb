require "yaml"
require "exercise_util"

class Wendler531Bbb
  attr_accessor :user, :mesocycle

  CYCLE_FACTOR = [[["5",0.65],["5",0.75],["5+",0.85]],[["3",0.70],["3",0.80],["3+",0.90]],[["5",0.75],["3",0.85],["1+",0.95]],[["5",0.40],["5",0.50],["5",0.60]]]
  CYCLE_STAGE_REPS = 0
  CYCLE_STAGE_FACTOR = 1

  BENCH_EXERCISE = Exercise.where(key: "bench").first
  DEADLIFT_EXERCISE = Exercise.where(key: "deadlift").first
  SQUAT_EXERCISE = Exercise.where(key: "squat").first
  OHP_EXERCISE = Exercise.where(key: "ohp").first

  DUMBBELL_ROW_EXERCISE = Exercise.where(key: "dumbbellrow").first
  HLR_EXERCISE = Exercise.where(key: "hanginglegraise").first
  CHIN_EXERCISE = Exercise.where(key: "chinup").first
  LEGCURL_EXERCISE = Exercise.where(key: "legcurl").first

  MAX_TRAINING_FACTOR = 0.90

  def description
    "5/3/1: The Simplest and Most Effective Training System for Raw Strength"
  end

  def origin_link
    "http://www.amazon.com/Simplest-Effective-Training-Strength-Edition/dp/B00686OYGQ"
  end

  def initialize(mesocycle)
    @mesocycle = mesocycle
  end

  def generate
    (["Week One", "Week Two", "Week Three", "Deload"]).each_with_index do |title, week|
      cycle = Cycle.new(name: title)

      cycle.workouts << build_bench(week, cycle)
      cycle.workouts << build_ohp(week, cycle)
      cycle.workouts << build_squat(week, cycle)
      cycle.workouts << build_deadlift(week, cycle)

      @mesocycle.cycles << cycle
    end

    return @mesocycle

  end


  def build_bench(week, cycle)

    workout = Workout.new(title: "Bench Press")
    workout.cycle = cycle

    (0..2).each do |stage|
      cycle_stage_config = CYCLE_FACTOR[week][stage]

      ls = LiftSet.new(reps: cycle_stage_config[CYCLE_STAGE_REPS], weight: ((@mesocycle.max_bench * MAX_TRAINING_FACTOR) * cycle_stage_config[CYCLE_STAGE_FACTOR]))
      ls.exercise = BENCH_EXERCISE


      workout.lift_sets << ls
    end

    (0..4).each do |sets|
      ls = LiftSet.new(reps: 10, weight: 0)
      ls.exercise = DUMBBELL_ROW_EXERCISE

      workout.lift_sets << ls
    end


    return workout

  end

  def build_ohp(week, cycle)

    bench_workout = Workout.new(title: "Overhead Press")
    bench_workout.cycle = cycle

    (0..2).each do |stage|
      cycle_stage_config = CYCLE_FACTOR[week][stage]

      ls = LiftSet.new(reps: cycle_stage_config[CYCLE_STAGE_REPS], weight: ((@mesocycle.max_ohp * MAX_TRAINING_FACTOR) * cycle_stage_config[CYCLE_STAGE_FACTOR]))
      ls.exercise = OHP_EXERCISE


      bench_workout.lift_sets << ls
    end

    (0..4).each do |sets|
      ls = LiftSet.new(reps: 10, weight: 0)
      ls.exercise = CHIN_EXERCISE

      bench_workout.lift_sets << ls
    end


    return bench_workout

  end

  def build_deadlift(week, cycle)

    workout = Workout.new(title: "Deadlift")
    workout.cycle = cycle

    (0..2).each do |stage|
      cycle_stage_config = CYCLE_FACTOR[week][stage]

      ls = LiftSet.new(reps: cycle_stage_config[CYCLE_STAGE_REPS], weight: ((@mesocycle.max_deadlift * MAX_TRAINING_FACTOR) * cycle_stage_config[CYCLE_STAGE_FACTOR]))
      ls.exercise = DEADLIFT_EXERCISE


      workout.lift_sets << ls
    end

    (0..4).each do |sets|
      ls = LiftSet.new(reps: 15, weight: 0)
      ls.exercise = HLR_EXERCISE

      workout.lift_sets << ls
    end


    return workout

  end

  def build_squat(week, cycle)

    workout = Workout.new(title: "Squat")
    workout.cycle = cycle

    (0..2).each do |stage|
      cycle_stage_config = CYCLE_FACTOR[week][stage]

      ls = LiftSet.new(reps: cycle_stage_config[CYCLE_STAGE_REPS], weight: ((@mesocycle.max_squat * MAX_TRAINING_FACTOR) * cycle_stage_config[CYCLE_STAGE_FACTOR]))
      ls.exercise = SQUAT_EXERCISE


      workout.lift_sets << ls
    end

    (0..4).each do |sets|
      ls = LiftSet.new(reps: 10, weight: 0)
      ls.exercise = HLR_EXERCISE

      workout.lift_sets << ls
    end


    return workout

  end


end