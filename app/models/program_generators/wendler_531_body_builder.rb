class Wendler531BodyBuilder
  attr_accessor :mesocycle

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

  UPRIGHT_ROW_EXERCISE = Exercise.where(key: "dbuprightrow").first
  DB_MILITARY_PRESS = Exercise.where(key: "dbmilitarypress").first
  DB_BENT_RAISE = Exercise.where(key: "bentdbraise").first
  DB_CURL = Exercise.where(key: "dbcurl").first
  DB_ROW = Exercise.where(key: "dbrow").first
  BACK_EXTENSION = Exercise.where(key: "backextension").first
  AB_WHEEL = Exercise.where(key: "abwheel").first
  DB_BENCH_PRESS = Exercise.where(key: "dbbenchpress").first
  DIP = Exercise.where(key: "dip").first
  DUMBBELL_FLY = Exercise.where(key: "dbfly").first
  TRICEP_PUSHDOWN = Exercise.where(key: "triceppushdown").first
  LEG_PRESS = Exercise.where(key: "legpress").first
  LEG_EXTENSION = Exercise.where(key: "legextension").first
  SIT_UP = Exercise.where(key: "situp").first

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

    (0..3).each do |sets|
      ls = LiftSet.new(reps: 10, weight: 0)
      ls.exercise = DB_BENCH_PRESS
      
      workout.lift_sets << ls
    end

    (0..3).each do |sets|
      ls = LiftSet.new(reps: 10, weight: 0)
      ls.exercise = DIP
      
      workout.lift_sets << ls
    end

    (0..3).each do |sets|
      ls = LiftSet.new(reps: 10, weight: 0)
      ls.exercise = DUMBBELL_FLY
      
      workout.lift_sets << ls
    end

    (0..3).each do |sets|
      ls = LiftSet.new(reps: 12, weight: 0)
      ls.exercise = TRICEP_PUSHDOWN
      
      workout.lift_sets << ls
    end

    
    return workout

  end

  def build_ohp(week, cycle)

    workout = Workout.new(title: "Overhead Press")
    workout.cycle = cycle

    (0..2).each do |stage|
      cycle_stage_config = CYCLE_FACTOR[week][stage]

      ls = LiftSet.new(reps: cycle_stage_config[CYCLE_STAGE_REPS], weight: ((@mesocycle.max_ohp * MAX_TRAINING_FACTOR) * cycle_stage_config[CYCLE_STAGE_FACTOR]))
      ls.exercise = OHP_EXERCISE
      

      workout.lift_sets << ls
    end

    (0..3).each do |sets|
      ls = LiftSet.new(reps: 10, weight: 0)
      ls.exercise = UPRIGHT_ROW_EXERCISE
      
      workout.lift_sets << ls
    end

    (0..3).each do |sets|
      ls = LiftSet.new(reps: 12, weight: 0)
      ls.exercise = DB_MILITARY_PRESS
      
      workout.lift_sets << ls
    end

    (0..3).each do |sets|
      ls = LiftSet.new(reps: 15, weight: 0)
      ls.exercise = DB_BENT_RAISE
      
      workout.lift_sets << ls
    end

    (0..3).each do |sets|
      ls = LiftSet.new(reps: 12, weight: 0)
      ls.exercise = DB_CURL
      
      workout.lift_sets << ls
    end

    
    return workout

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

    (0..3).each do |sets|
      ls = LiftSet.new(reps: 10, weight: 0)
      ls.exercise = CHIN_EXERCISE
      
      workout.lift_sets << ls
    end

    (0..3).each do |sets|
      ls = LiftSet.new(reps: 15, weight: 0)
      ls.exercise = DB_ROW
      
      workout.lift_sets << ls
    end

    (0..3).each do |sets|
      ls = LiftSet.new(reps: 25, weight: 0)
      ls.exercise = BACK_EXTENSION
      
      workout.lift_sets << ls
    end

    (0..3).each do |sets|
      ls = LiftSet.new(reps: 15, weight: 0)
      ls.exercise = AB_WHEEL
      
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

    (0..3).each do |sets|
      ls = LiftSet.new(reps: 12, weight: 0)
      ls.exercise = LEG_PRESS
      
      workout.lift_sets << ls
    end

    (0..3).each do |sets|
      ls = LiftSet.new(reps: 12, weight: 0)
      ls.exercise = LEG_EXTENSION
      
      workout.lift_sets << ls
    end

    (0..3).each do |sets|
      ls = LiftSet.new(reps: 12, weight: 0)
      ls.exercise = LEGCURL_EXERCISE
      
      workout.lift_sets << ls
    end

    (0..3).each do |sets|
      ls = LiftSet.new(reps: 25, weight: 0)
      ls.exercise = SIT_UP
      
      workout.lift_sets << ls
    end

    
    return workout

  end


end